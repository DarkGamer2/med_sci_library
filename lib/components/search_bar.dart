import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: TextField(
          autofocus: true,
          // Use onChanged to trigger your Provider/Search logic
          onChanged: (value) {
            // This is where you'd call context.read<SearchProvider>().search(value);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            // Standard search icon at the start
            prefixIcon: const Icon(Icons.search),
            // If you want a clickable button at the end:
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                // Logic to clear the search
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
