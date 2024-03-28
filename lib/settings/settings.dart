import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:enchanteddiary/help/help.dart';
import 'package:enchanteddiary/pin/secret_question_config.dart';
import 'package:enchanteddiary/pin/secret_question_form.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/settings/username.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/settings/privacy_policy.dart';
import 'package:enchanteddiary/settings/terms_and_conditions.dart';
import 'package:enchanteddiary/settings/username.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  late SharedPreferences _prefs;
  bool pushNotifications = false;
  bool darkMode = false;
  String userImage = '';
  String cameraImage = '';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      pushNotifications = _prefs.getBool('pushNotifications') ?? false;
      darkMode = _prefs.getBool('darkMode') ?? false;
      userImage = _prefs.getString('userImage') ?? 'assets/images/Matt.jpg';
      String? cameraImagePath = _prefs.getString('cameraImage');
      if (cameraImagePath == null) {
        cameraImage = "assets/images/Matt.jpg";
      } else {
        File file = File(cameraImagePath);
        if (file.existsSync()) {
          cameraImage = cameraImagePath;
        } else {
          userImage = "assets/images/Matt.jpg";
        }
      }
    });
  }

  Future<void> _saveSetting(String key, dynamic value) async {
    setState(() {
      if (key == 'pushNotifications') {
        pushNotifications = value;
      } else if (key == 'darkMode') {
        darkMode = value;
      }
    });

    if (key == 'pushNotifications' || key == 'darkMode') {
      await _prefs.setBool(key, value);
    } else if (key == 'userImage') {
      await _prefs.setString('userImage', value);
      await _prefs.setString('cameraImage', '');
    } else if (key == 'cameraImage') {
      await _prefs.setString('cameraImage', value);
    }
  }

  Future<void> _deleteSetting(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> _showPhotoSelectionDialog() async {
    String? newImage = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sélectionner une photo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPhotoOption('assets/images/Alexis.jpg'),
              _buildPhotoOption('assets/images/Clara.jpg'),
              _buildPhotoOption('assets/images/Matt.jpg'),
              _buildPhotoOption('assets/images/Mathias.jpg'),
              _buildCameraOption(),
            ],
          ),
        );
      },
    );

    if (newImage != null) {
      setState(() {
        userImage = newImage;
        cameraImage = ''; // Vider l'image de la caméra
      });

      await _saveSetting('userImage', newImage);
    }
  }

  Widget _buildPhotoOption(String imagePath) {
    return GestureDetector(
      onTap: () {
        _selectNewImage(imagePath);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
      ),
    );
  }

  Widget _buildCameraOption() {
    return GestureDetector(
      onTap: () {
        _takePhotoFromCamera();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor:
              Colors.grey, // Change the color to indicate it's a camera option
          radius: 30,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _selectNewImage(String imagePath) async {
    setState(() {
      userImage = imagePath;
      cameraImage = '';
    });
    Navigator.of(context).pop();
    await _deleteSetting('cameraImage'); // Supprimer la clé 'cameraImage'
    await _saveSetting('userImage', imagePath);
  }

  Future<String> _copyImageToAssetsDirectory(String sourceImagePath) async {
    final String fileName = sourceImagePath.split('/').last;

    // Obtenir le répertoire des ressources de l'application
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String newPath = '${appDir.path}/$fileName';

    // Copier l'image depuis le chemin source vers le répertoire des ressources
    final File newImage = await File(sourceImagePath).copy(newPath);

    return newPath;
  }

  Future<void> _takePhotoFromCamera() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final String newImagePath =
          await _copyImageToAssetsDirectory(pickedFile.path);

      setState(() {
        userImage = '';
        cameraImage = newImagePath;
      });

      Navigator.of(context).pop();
      await _deleteSetting('userImage');
      await _saveSetting('cameraImage', newImagePath);
    }
  }

  Widget _buildCircleAvatar() {
    if (!cameraImage.isEmpty) {
      return CircleAvatar(
        radius: 30,
        backgroundImage: FileImage(File(cameraImage)),
      );
    } else {
      return CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(userImage),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      backgroundColor: lightYellow,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              _showPhotoSelectionDialog();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildCircleAvatar(),
                  SizedBox(width: 16),
                  Expanded(
                    child: UsernameEditorRow(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              "Preferences",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
            title: Text("Change PIN", style: TextStyle(fontFamily: 'Poppins')),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecretQuestionFormPage()));
            },
          ),
          ListTile(
            title: Text("Push", style: TextStyle(fontFamily: 'Poppins')),
            trailing: Switch(
              activeColor: Color.fromRGBO(127, 202, 199, 1.0),
              value: pushNotifications,
              onChanged: (newValue) {
                _saveSetting('pushNotifications', newValue);
              },
            ),
          ),
          ListTile(
            title: Text("Dark mode", style: TextStyle(fontFamily: 'Poppins')),
            trailing: Switch(
              activeColor: Color.fromRGBO(127, 202, 199, 1.0),
              value: darkMode,
              onChanged: (newValue) {
                _saveSetting('darkMode', newValue);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              "More",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontFamily: 'Poppins',
              ),
            ),
          ),
          ListTile(
            title: Text("About us", style: TextStyle(fontFamily: 'Poppins')),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
          ListTile(
            title:
                Text("Privacy policy", style: TextStyle(fontFamily: 'Poppins')),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          ListTile(
            title: Text("Terms and conditions",
                style: TextStyle(fontFamily: 'Poppins')),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FancyTermsAndConditionsPage()));
            },
          ),
          Spacer(),
          Container(
            color: Colors.grey[200],
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
