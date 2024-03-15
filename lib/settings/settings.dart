import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late SharedPreferences _prefs;
  bool pushNotifications = false;
  bool darkMode = false;
  String userImage = 'assets/images/Matt.jpg';

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
    });
  }

  Future<void> _saveSetting(String key, bool value) async {
    setState(() {
      if (key == 'pushNotifications') {
        pushNotifications = value;
      } else if (key == 'darkMode') {
        darkMode = value;
      }
    });
    await _prefs.setBool(key, value);
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
    }
  }

  Widget _buildPhotoOption(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          userImage = imagePath;
        });
        Navigator.of(context)
            .pop(); // Fermer la boîte de dialogue après la sélection
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
                  Text(
                    'Nom de l\'utilisateur',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
              // Action lorsqu'on clique sur "Changer de mot de passe"
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
              // Action lorsqu'on clique sur "À propos de nous"
            },
          ),
          ListTile(
            title: Text("Privacy policy"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Action lorsqu'on clique sur "Politique de confidentialité"
            },
          ),
          ListTile(
            title: Text("Terms and conditions"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Action lorsqu'on clique sur "Conditions d'utilisation"
            },
          ),
          // Le reste de votre contenu...
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
