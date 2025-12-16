import 'package:flutter/material.dart';

final List<Map<String, String>> books = [
  {
    'title': '2024 AHA Guide',
    'author': 'American Hospital Association',
    'image': 'assets/images/aha.jpg',
  },
  {
    'title': 'Aquaculture Microbiology',
    'author': 'John Thomas',
    'image': 'assets/images/Aquaculture.jpg',
  },
  {
    'title': 'ASHP Injectable Drug Information',
    'author': 'Author 2',
    'image': 'assets/images/ASHP.jpg',
  },
];

class NewAcquisitionsPage extends StatelessWidget {
  const NewAcquisitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Acquisitions')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'New Acquisitions',
              style: TextStyle(
                fontSize: 24,
                fontFamily: "BebasNeue",
                color: Color(0xFFD92095),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: Image.asset(book['image']!),
                  title: Text(
                    book['title']!,
                    style: TextStyle(color: Color(0xFFD92095)),
                  ),
                  subtitle: Text(book['author']!),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFFD92095)),
            ),
          ),
        ],
      ),
    );
  }
}
