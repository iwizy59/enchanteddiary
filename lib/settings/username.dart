import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameEditorRow extends StatefulWidget {
  @override
  _UsernameEditorRowState createState() => _UsernameEditorRowState();
}

class _UsernameEditorRowState extends State<UsernameEditorRow> {
  late TextEditingController _controller;
  String _username = 'Username';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _username);
    _loadUsername();
  }

  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Username';
    });
  }

  void _saveUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    setState(() {
      _username = _controller.text;
    });
  }

  void _editUsername() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Username'),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Enter new username'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _saveUsername();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(_username, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: _editUsername,
        ),
      ],
    );
  }
}
