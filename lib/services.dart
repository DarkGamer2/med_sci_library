import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  static const primaryPink = Color(0xFFD92095);
  static const backgroundColor = Color(0xFFF8F9FA);

  static final Map<String, Uri> _links = {
    'medlib_chat': Uri.parse(
      "https://libraries.sta.uwi.edu/msl/images/notice/Flyer_MEDLIB_Chat.pdf",
    ),
    'calendar': Uri.parse("https://example.com/calendar"),
    'videos': Uri.parse("https://example.com/videos"),
  };

  final List<Map<String, dynamic>> _services = const [
    {
      'title': 'Printing',
      'description': 'High-speed black and white or vibrant color printing.',
      'icon': Icons.print_rounded,
    },
    {
      'title': 'Scanning',
      'description':
          'Secure, high-resolution digital scanning for all documents.',
      'icon': Icons.qr_code_scanner_rounded,
    },
    {
      'title': 'Wi-Fi Access',
      'description': 'Ultra-fast gigabit connection available library-wide.',
      'icon': Icons.wifi_rounded,
    },
    {
      'title': 'Device Loans',
      'description': 'Laptops & Tablets available for semester use.',
      'icon': Icons.devices_rounded,
    },
  ];

  Future<void> _handleLaunch(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'LIBRARY SERVICES',
          style: TextStyle(
            fontFamily: 'BebasNeue',
            color: primaryPink,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("I.T. SERVICES"),
              const SizedBox(height: 16),
              _buildResponsiveGrid(context),

              const SizedBox(height: 40),
              _buildSectionHeader("INFORMATION SKILLS TRAINING"),
              const SizedBox(height: 16),
              _buildActionCard(
                buttons: [
                  _linkButton(
                    "Library Training Calendar",
                    () => _handleLaunch(_links['calendar']!),
                  ),
                  _linkButton(
                    "Library Training Videos",
                    () => _handleLaunch(_links['videos']!),
                  ),
                  _linkButton("Training Presentations", () {}),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionHeader("Reference Services"),
              const SizedBox(height: 16),
              _buildActionCard(
                child: _linkButton(
                  "Chat with a Librarian",
                  () => _handleLaunch(_links['medlib_chat']!),
                ),
              ),

              const SizedBox(height: 24),
              _buildSectionHeader("Ask A Librarian"),
              const SizedBox(height: 16),
              _buildActionCard(
                child: _linkButton(
                  "Ask A Librarian",
                  () => _handleLaunch(_links['medlib_chat']!),
                ),
              ),

              const SizedBox(height: 24),
              _buildSectionHeader('Loans, Returns & Fines'),
              const SizedBox(height: 16),
              _buildActionCard(
                child: _linkButton(
                  "How To Pay Fines",
                  () => _handleLaunch(_links['medlib_chat']!),
                ),
              ),

              const SizedBox(height: 24),
              _buildSectionHeader('Systematic Reviews'),
              const SizedBox(height: 16),
              _buildActionCard(
                buttons: [
                  _linkButton("Systematic Reviews Flyer", () {}),
                  _linkButton("Systematic Reviews Training", () {}),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionHeader("Document Delivery Service"),
              const SizedBox(height: 16),
              _buildActionCard(
                buttons: [
                  _linkButton("Document Delivery Service CMTF", () {}),
                  _linkButton("Document Delivery Service Email", () {}),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionHeader('Library Clearance'),
              const SizedBox(height: 16),
              _buildActionCard(child: _linkButton("Request Clearance", () {})),

              const SizedBox(height: 24),
              _buildSectionHeader("MSL Remote Services"),
              const SizedBox(height: 16),
              _buildActionCard(
                child: _linkButton(
                  "Chat with a Librarian",
                  () => _handleLaunch(_links['medlib_chat']!),
                ),
              ),

              const SizedBox(height: 24),
              _buildSectionHeader("Services For Alumni"),
              const SizedBox(height: 16),
              _buildActionCard(
                child: _linkButton(
                  "Chat with a Librarian",
                  () => _handleLaunch(_links['medlib_chat']!),
                ),
              ),

              const SizedBox(height: 24),
              _buildSectionHeader('Device Loans'),
              const SizedBox(height: 16),
              _buildActionCard(
                buttons: [
                  _linkButton("Laptop & Tablets", () {}),
                  _linkButton("Mifi Devices", () {}),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionHeader("Computer Lab Walk-In Clinic"),
              const SizedBox(height: 16),
              _buildActionCard(
                child: _linkButton(
                  "Visit",
                  () => _handleLaunch(_links['medlib_chat']!),
                ),
              ),

              // Added a little bottom padding so the last card doesn't touch the screen edge
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontFamily: 'BebasNeue',
            color: primaryPink,
          ),
        ),
        Container(
          height: 3,
          width: 40,
          decoration: BoxDecoration(
            color: primaryPink,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({Widget? child, List<Widget>? buttons}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryPink.withValues(alpha: 0.1)),
      ),
      child: Center(child: Column(children: buttons ?? [child!])),
    );
  }

  Widget _linkButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPink,
          minimumSize: const Size(200, 45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: screenWidth > 600 ? 1.3 : 1.8,
      ),
      itemBuilder: (context, index) {
        final service = _services[index];
        return ServiceCard(
          title: service['title'],
          description: service['description'],
          icon: service['icon'],
        );
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: const Color(0xFFD92095)),
            const SizedBox(height: 12),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 18,
                color: Color(0xFF2D2D2D),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
