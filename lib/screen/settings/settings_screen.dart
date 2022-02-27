import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Admin"),
            subtitle: const Text(
                "Once you get admin access, you can manage the apps"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext buildContext) {
                  return AlertDialog(
                    title: const Text('Admin'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              labelText: 'Admin',
                              hintText: 'Please enter admin password',
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Access'),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Incorrect password")),
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Light theme"),
              onTap: () {}),
          ListTile(
              title: const Text("About"),
              subtitle: const Text("About"),
              onTap: () {}),
        ],
      ),
    );
  }
}
