import 'package:flutter/material.dart';
import 'package:med_sci_library/fonts/controller.dart';

// Theme Controller to manage theme state
class ThemeController {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.light,
  );

  static void setDark(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}

final List<DropdownMenuEntry<String>> dropdownMenuEntries = [
  DropdownMenuEntry(value: 'Extra Small', label: '12'),
  DropdownMenuEntry(value: 'Small', label: '14'),
  DropdownMenuEntry(value: 'Medium', label: '18'),
  DropdownMenuEntry(value: 'Large', label: '24'),
  DropdownMenuEntry(value: 'Extra Large', label: '30'),
];

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // 1. Wrap EVERYTHING in the Font Builder so the variable is available everywhere
    return ValueListenableBuilder<double>(
      valueListenable: FontSizeController.fontSize,
      builder: (context, currentSize, child) {
        // 2. Also listen to ThemeController so the UI updates when you toggle Dark Mode
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: ThemeController.themeMode,
          builder: (context, mode, child) {
            return Theme(
              data:
                  mode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light(),
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 24, // Headers usually stay consistent
                              fontFamily: "BebasNeue",
                              color: Color(0xFFD92095),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // DARK MODE TILE
                        ListTile(
                          title: Text(
                            "Dark Mode",
                            style: TextStyle(fontSize: currentSize),
                          ),
                          trailing: Switch(
                            value: mode == ThemeMode.dark,
                            onChanged:
                                (bool value) => ThemeController.setDark(value),
                          ),
                        ),

                        // FONT SIZE TILE
                        ListTile(
                          title: Text(
                            'Font Size',
                            style: TextStyle(fontSize: currentSize),
                          ),
                          trailing: DropdownMenu<String>(
                            dropdownMenuEntries: dropdownMenuEntries,
                            // Set this to 'Medium' so it matches your controller's default
                            initialSelection: 'Medium',
                            label: const Text('Size'),
                            onSelected: (String? newValue) {
                              if (newValue != null) {
                                // Update the global controller
                                FontSizeController.setFontSize(newValue);
                              }
                            },
                          ),
                        ),

                        // OTHER TILES (Now using currentSize correctly)
                        ListTile(
                          title: Text(
                            'Notification Settings',
                            style: TextStyle(fontSize: currentSize),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Privacy Policy',
                            style: TextStyle(fontSize: currentSize),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Terms of Service',
                            style: TextStyle(fontSize: currentSize),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {},
                        ),

                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD92095),
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(fontSize: currentSize),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
