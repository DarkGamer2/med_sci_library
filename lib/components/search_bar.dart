import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:med_sci_library/store_search_logic.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({super.key});

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
} // Fixed: Close the SearchBarComponent class here

class _SearchBarComponentState extends State<SearchBarComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override // Added: Good practice to include @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: TextField(
          controller:
              _controller, // Added: Link the controller to the TextField
          autofocus: true,
          onChanged: (value) {
            context.read<SearchProvider>().search(value);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear(); // Clear the text field visually
                context.read<SearchProvider>().search(''); // Clear the logic
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
