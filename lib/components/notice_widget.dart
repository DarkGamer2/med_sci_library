// lib/widgets/notice_widget.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/notice.dart';

class NoticeWidget extends StatelessWidget {
  final Notice notice;

  const NoticeWidget({super.key, required this.notice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle notice tap - maybe show full screen image
        showDialog(
          context: context,
          builder:
              (context) => Dialog(
                child: InteractiveViewer(
                  child:
                      notice.image != null
                          ? Image.memory(
                            base64Decode(notice.image!),
                            fit: BoxFit.contain,
                          )
                          : Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text('No Image Available'),
                            ),
                          ),
                ),
              ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.transparent,
          child:
              notice.image != null
                  ? AspectRatio(
                    aspectRatio: 1, // Makes the container square
                    child: Image.memory(
                      base64Decode(notice.image!),
                      fit:
                          BoxFit
                              .contain, // Changed from BoxFit.cover to BoxFit.contain
                      width: double.infinity,
                      height: double.infinity, // Changed to infinity
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.broken_image, size: 40),
                          ),
                        );
                      },
                    ),
                  )
                  : AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey[300],
                      child: const Center(child: Text('No Image')),
                    ),
                  ),
        ),
      ),
    );
  }
}
