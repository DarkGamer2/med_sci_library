import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:med_sci_library/components/contact_card.dart';
import 'package:med_sci_library/main.dart';

class Librarian {
  final String name;
  final String librarianImage;
  final String id;
  Librarian({
    required this.name,
    required this.librarianImage,
    required this.id,
  });
}

// Replace this with your actual lookup (e.g. from a list or API).
Librarian getLibrarianById(String id) {
  return Librarian(
    name: 'Librarian Name',
    librarianImage: 'assets/images/default_profile_pic.png',
    id: id,
  );
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
    GoRoute(
      path: '/contact/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final librarian = getLibrarianById(id);
        return ContactCard(
          librarianName: librarian.name,
          librarianImage: librarian.librarianImage,
          id: librarian.id,
        );
      },
    ),
  ],
);
