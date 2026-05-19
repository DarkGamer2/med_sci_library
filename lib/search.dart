import 'package:flutter/material.dart';
import 'package:med_sci_library/components/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:med_sci_library/store_search_logic.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SearchBarComponent(),
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, provider, child) {
                final results = provider.filteredResults;

                if (results.isEmpty) {
                  return const Center(child: Text("No results found"));
                }
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final item = results[index];
                    return ListTile(
                      title: Text(item.title),
                      onTap: () {
                        Navigator.pushNamed(context, item.route);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
