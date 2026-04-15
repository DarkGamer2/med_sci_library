import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notice.dart';

class NoticeService {
  static const String apiURL = 'http://10.0.2.2:3000/api';

  Future<List<Notice>> fetchNotices() async {
    try {
      final response = await http.get(
        Uri.parse('$apiURL/data'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Notice.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      throw Exception('Error fetching notices: $e');
    }
  }

  Future<String?> fetchNoticeImage(String noticeId) async {
    try {
      final response = await http.get(
        Uri.parse('$apiURL/data/$noticeId/image'),
      );

      if (response.statusCode == 200) {
        return base64Encode(response.bodyBytes);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error fetching notice image: $e');
    }
  }
}
