class Contact {
  final String image;
  final String name;
  final String email;
  final String phoneNumber;
  final int? id;

  Contact({
    required this.image,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.id,
  });
}
