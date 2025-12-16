import "package:flutter/material.dart";

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    // Adjust crossAxisCount based on screen width (2 for phones, 3 for tablets)
    final crossAxisCount = screenWidth > 600 ? 3 : 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Library Services',
          style: TextStyle(fontFamily: 'BebasNeue', color: Color(0xFFD92095)),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "I.T Services",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'BebasNeue',
                      color: Color(0xFFD92095),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 3 / 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ServiceCard(
                    title: 'Printing',
                    description: 'Black and white or color printing services.',
                    icon: Icons.print,
                  ),
                  ServiceCard(
                    title: 'Scanning',
                    description: 'High-quality document scanning services.',
                    icon: Icons.camera_alt,
                  ),
                  ServiceCard(
                    title: 'Wi-Fi Access',
                    description: 'Free Wi-Fi available throughout the library.',
                    icon: Icons.wifi,
                  ),
                  ServiceCard(
                    title: 'Device Loans',
                    description: 'Laptops and tablets available for loan.',
                    icon: Icons.laptop_mac,
                  ),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
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
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Color(0xFFD92095)),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 18,
                color: Color(0xFFD92095),
              ),
            ),
            SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
