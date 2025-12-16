import 'package:flutter/material.dart';

// Define dropdown menu entries for font size selection
final List<DropdownMenuEntry<String>> dropdownMenuEntries = [
  DropdownMenuEntry(value: 'Small', label: '12'),
  DropdownMenuEntry(value: 'Medium', label: '18'),
  DropdownMenuEntry(value: 'Large', label: '24'),
];

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "BebasNeue",
                    color: Color(0xFFD92095),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text("Dark Mode"),
                trailing: Switch(
                  value: false,
                  onChanged: (bool value) {
                    // Handle dark mode toggle
                  },
                ),
              ),
              ListTile(
                title: const Text('Font Size'),
                trailing: DropdownMenu<String>(
                  dropdownMenuEntries: dropdownMenuEntries,
                ),
                onTap: () {
                  // Handle font size change
                },
              ),
              ListTile(
                title: const Text('Notification Settings'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to notification settings page
                },
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to privacy policy page
                },
              ),
              ListTile(
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to terms of service page
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save settings action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD92095),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
