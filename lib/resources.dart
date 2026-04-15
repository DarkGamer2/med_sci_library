import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatelessWidget {
  const Resources({super.key});

  static final Map<String, Uri> _links = {
    'databases': Uri.parse(
      'https://libraries.sta.uwi.edu/apps/index.php/DatabaseSearch/index',
    ),
    'eJournals': Uri.parse('https://sfxhosted.exlibrisgroup.com/uwi/az/sta'),
    'journalCoverage': Uri.parse(
      'https://libraries.sta.uwi.edu/msl/index.php/library-resources/journals/journals-a-z-list',
    ),
    'eBooks': Uri.parse(
      'https://libraries.sta.uwi.edu/msl/index.php/library-resources/ebooks',
    ),
  };

  static const primaryPink = Color(0xFFD92095);

  Future<void> _handleLaunch(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "LIBRARY RESOURCES",
          style: TextStyle(
            fontFamily: "BebasNeue",
            color: primaryPink,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionLabel("AVAILABLE ONLINE"),
              const SizedBox(height: 16),
              _ResourceTile(
                title: "Databases",
                subtitle: "Access the full Databases A-Z List",
                icon: Icons.storage_rounded,
                onTap: () => _handleLaunch(_links['databases']!),
              ),
              _ResourceTile(
                title: "Journals",
                subtitle: "Browse our collection of E-Journals",
                icon: Icons.menu_book_rounded,
                onTap: () => _handleLaunch(_links['eJournals']!),
              ),
              _ResourceTile(
                title: "Journal Coverage",
                subtitle: "Database Journal A-Z Coverage List",
                icon: Icons.find_in_page_rounded,
                onTap: () => _handleLaunch(_links['journalCoverage']!),
              ),
              _ResourceTile(
                title: "E-Books",
                subtitle: "View and borrow digital textbooks",
                icon: Icons.tablet_android_rounded,
                onTap: () => _handleLaunch(_links['eBooks']!),
              ),
              _ResourceTile(
                title: "Research & Scholarship",
                subtitle: "Research",
                icon: Icons.book_online,
                onTap: () => _handleLaunch(_links['Research']!),
              ),
              _ResourceTile(
                title: "Academic Writing Style",
                subtitle: "Research",
                icon: Icons.book_online,
                onTap: () => _handleLaunch(_links['Research']!),
              ),
              _ResourceTile(
                title: "Writing For Publication",
                subtitle: "Research",
                icon: Icons.book_online,
                onTap: () => _handleLaunch(_links['Research']!),
              ),
              _ResourceTile(
                title: "New Titles",
                subtitle: "Research",
                icon: Icons.book_online,
                onTap: () => _handleLaunch(_links['Research']!),
              ),
              _ResourceTile(
                title: "Medical Sciences Apps",
                subtitle: "Research",
                icon: Icons.book_online,
                onTap: () => _handleLaunch(_links['Research']!),
              ),
              _ResourceTile(
                title: "Research Guides",
                subtitle: "Research",
                icon: Icons.book_online,
                onTap: () => _handleLaunch(_links['Research']!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey[600],
        letterSpacing: 1.1,
      ),
    );
  }
}

class _ResourceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ResourceTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // Updated to withValues
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // Updated to withValues
            color: const Color(0xFFD92095).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFD92095), size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: "BebasNeue",
            fontSize: 20,
            color: Color(0xFF2D2D2D),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontFamily: "Outfit",
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
