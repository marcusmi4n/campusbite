import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Account Settings"),
            onTap: () {
              // Navigate to account settings
            },
          ),
          ListTile(
            title: Text("Notifications"),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          ListTile(
            title: Text("Privacy"),
            onTap: () {
              // Navigate to privacy settings
            },
          ),
          ListTile(
            title: Text("Language"),
            onTap: () {
              // Navigate to language settings
            },
          ),
          ListTile(
            title: Text("Theme"),
            trailing: Switch(
              value: true, // Switch based on user preference
              onChanged: (value) {
                // Handle theme toggle (Dark/Light)
              },
            ),
            onTap: () {
              // Toggle theme
            },
          ),
        ],
      ),
    );
  }
}
