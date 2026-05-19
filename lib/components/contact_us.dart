import "package:flutter/material.dart";
import "package:med_sci_library/components/contact_card.dart";

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "BebasNeue",
              color: Color(0xFFD92095),
            ),
          ),
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
                    onTap: () => Navigator.pushNamed(context, '/contact/1'),
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
                          style: TextStyle(color: Color(0xFFD92095)),
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
                        "Ayaana Alleyne-Roberts",
                        style: TextStyle(color: Color(0xFFD92095)),
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
                        "Niala Dwarika-Bhagat",
                        style: TextStyle(color: Color(0xFFD92095)),
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
                        style: TextStyle(color: Color(0xFFD92095)),
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
  }
}
