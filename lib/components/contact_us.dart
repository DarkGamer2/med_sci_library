import 'package:flutter/material.dart';
import 'package:med_sci_library/fonts/controller.dart';
import 'package:med_sci_library/models/contact.dart';

class ContactUs extends StatefulWidget {
  final String? id;
  const ContactUs({super.key, this.id});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

final List<Contact> _contacts = [
  Contact(
    name: "Avril E. Reid (Ms.)",
    email: "Avril.Reid@uwi.edu",
    phoneNumber: " (868) 225-4673 ext. 5206, 5205",
    image: "assets/images/default_profile_pic.png",
    id: 1,
  ),
  Contact(
    name: "Ayaana Alleyne-Roberts",
    email: "Ayaana.Alleyne-Roberts@uwi.edu",
    phoneNumber: "(868) 225-4673 ext. 5201",
    image: "assets/images/default_profile_pic.png",
    id: 2,
  ),
  Contact(
    name: "Niala Dwarika-Bhagat",
    email: "Niala.Dwarika-Bhagat@uwi.edu",
    phoneNumber: "(868) 225-4673 ext. 5244 ",
    image: "assets/images/default_profile_pic.png",
    id: 3,
  ),
  Contact(
    name: "Unika Omowale",
    email: "Unika.Omowale@uwi.edu",
    phoneNumber: "(868) 225-4673 ext. 5201",
    image: "assets/images/default_profile_pic.png",
    id: 4,
  ),
];

Contact? _selectedContact;

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: FontSizeController.fontSize,
      builder: (context, currentFontSize, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: currentFontSize,
                  fontFamily: "BebasNeue",
                  color: Color(0xFFD92095),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              '/contact/${_contacts[0].id}',
                            ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/default_profile_pic.png",
                              ),
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                            Text(
                              "Avril E. Reid (Ms.)",
                              style: TextStyle(
                                fontSize: currentFontSize,
                                color: Color(0xFFD92095),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              '/contact/${_contacts[1].id}',
                            ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/default_profile_pic.png",
                              ),
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                            Text(
                              "Ayaana Alleyne-Roberts",
                              style: TextStyle(
                                color: Color(0xFFD92095),
                                fontSize: currentFontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              "assets/images/default_profile_pic.png",
                            ),
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          Text(
                            "Niala Dwarika-Bhagat",
                            style: TextStyle(
                              color: Color(0xFFD92095),
                              fontSize: currentFontSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              "assets/images/default_profile_pic.png",
                            ),
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          Text(
                            "Unika Omowale",
                            style: TextStyle(
                              color: Color(0xFFD92095),
                              fontSize: currentFontSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
