class Notice {
  final String id;
  final String? image;
  final String? filename;
  final String? contentType;

  Notice({required this.id, this.image, this.filename, this.contentType});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['_id'] ?? '',
      image: json['image'],
      filename: json['filename'],
      contentType: json['contentType'],
    );
  }
}
