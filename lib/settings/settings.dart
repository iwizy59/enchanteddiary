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

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late SharedPreferences _prefs;
  bool pushNotifications = false;
  bool darkMode = false;
  String userImage = '';

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

    await _prefs.setString(key, value);

    if (key == 'userImage') {
      await _prefs.setString(
          'userImage', value); // Sauvegarde du chemin de l'image
    }
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
            ],
          ),
        );
      },
    );

    if (newImage != null) {
      setState(() {
        userImage = newImage;
      });

      await _saveSetting(
          'userImage', newImage); // Sauvegarder la nouvelle image
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

  Future<void> _selectNewImage(String imagePath) async {
    setState(() {
      userImage = imagePath;
    });
    Navigator.of(context)
        .pop(); // Fermer la boîte de dialogue après la sélection
    await _saveSetting('userImage', imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
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
                  CircleAvatar(
                    backgroundImage: AssetImage(userImage),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    // Ajoutez ceci
                    child: UsernameEditorRow(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              "Préférences",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          ListTile(
            title: Text("Change PIN"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecretQuestionFormPage()));
            },
          ),
          ListTile(
            title: Text("Notifications push"),
            trailing: Switch(
              activeColor: Color.fromRGBO(127, 202, 199, 1.0),
              value: pushNotifications,
              onChanged: (newValue) {
                _saveSetting('pushNotifications', newValue);
              },
            ),
          ),
          ListTile(
            title: Text("Mode sombre"),
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
              ),
            ),
          ),
          ListTile(
            title: Text("About us"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
          ListTile(
            title: Text("Privacy policy"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          ListTile(
            title: Text("Terms and conditions"),
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
