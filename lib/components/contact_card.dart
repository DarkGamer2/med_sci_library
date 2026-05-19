import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.librarianName,
    required this.librarianImage,
    required this.id,
  });

  final String librarianName;
  final String librarianImage;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(librarianImage),
          fit: BoxFit.cover,
          height: 100,
          width: 100,
        ),
        Text(librarianName, style: TextStyle(color: Color(0xFFD92095))),
      ],
    );
  }
}
