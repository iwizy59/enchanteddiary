import 'package:enchanteddiary/pin/secret_question_config.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late SharedPreferences _prefs;
  late bool pushNotifications = false;
  late bool darkMode = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              // Action lorsque la photo est cliquée
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    // Remplacez cette image par l'image de l'utilisateur
                    backgroundImage:
                        AssetImage('assets/images/onboarding/cat.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Text(
                    _prefs.getString('username') ?? 'Username',
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
            title: Text("Change Settings"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecretQuestionConfigPage()));
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
            title: Text("Dark mode"),
            trailing: Switch(
              value: darkMode,
              activeColor: Color.fromRGBO(127, 202, 199, 1.0),
              onChanged: (newValue) async {
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
