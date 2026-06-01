import "package:med_sci_library/models/contact.dart";

class ContactService {
  static final Map<String, Contact> _contacts = {
    "1": Contact(
      name: "Avril E. Reid (Ms.)",
      email: "Avril.Reid@uwi.edu",
      phoneNumber: " (868) 225-4673 ext. 5206, 5205",
      image: "assets/images/default_profile_pic.png",
      id: 1,
    ),
    "2": Contact(
      name: "Ayaana Alleyne-Roberts",
      email: "Ayaana.Alleyne-Roberts@uwi.edu",
      phoneNumber: "(868) 225-4673 ext. 5201",
      image: "assets/images/default_profile_pic.png",
      id: 2,
    ),
    "3": Contact(
      name: "Niala Dwarika-Bhagat",
      email: "Niala.Dwarika-Bhagat@uwi.edu",
      phoneNumber: "(868) 225-4673 ext. 5244 ",
      image: "assets/images/default_profile_pic.png",
      id: 3,
    ),
    "4": Contact(
      name: "Unika Omowale",
      email: "Unika.Omowale@uwi.edu",
      phoneNumber: "(868) 225-4673 ext. 5201",
      image: "assets/images/default_profile_pic.png",
      id: 4,
    ),
  };

  static Contact? getById(String id) => _contacts[id];
}
