import 'package:flutter/material.dart';
import 'package:med_sci_library/models/contact.dart';
import "package:med_sci_library/fonts/controller.dart";

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
    required this.onTap,
    required this.id,
  });

  final Contact contact;
  final VoidCallback onTap;
  final String id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(contact.image),
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
          ValueListenableBuilder<double>(
            valueListenable: FontSizeController.fontSize,
            builder: (context, currentFontSize, _) {
              return Column(
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(
                      color: Color(0xFFD92095),
                      fontSize: currentFontSize,
                      fontFamily: "BebasNeue",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD92095),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Go Back"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
