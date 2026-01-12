import 'package:flutter/material.dart';
import 'package:med_sci_library/settings.dart' hide ThemeController;
import 'package:med_sci_library/new_acquisitions.dart';
import 'package:med_sci_library/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:med_sci_library/resources.dart';
import 'package:med_sci_library/theme/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeMode,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Medical Sciences Library',
          theme: ThemeData.light().copyWith(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xFFD92095),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Color(0xFFD92095),
            ),
          ),
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
          routes: {
            '/settings': (context) => const SettingsPage(),
            '/home': (context) => const MainScreen(),
            '/services': (context) => const ServicesPage(),
          },
        );
      },
    );
  }
}

final List<Map<String, String>> books = [
  {
    'title': '2024 AHA Guide',
    'author': 'American Hospital Association',
    'image': 'assets/images/aha.jpg',
  },
  {
    'title': 'Aquaculture Microbiology',
    'author': 'John Thomas',
    'image': 'assets/images/Aquaculture.jpg',
  },
  {
    'title': 'ASHP Injectable Drug Information',
    'author': 'Author 2',
    'image': 'assets/images/ASHP.jpg',
  },
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(), // ✅ Use new HomePage widget here
    const Resources(), // ✅ Use existing Resources widget
    const ServicesPage(), // ✅ Use existing ServicesPage widget
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFD92095),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Resources',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Services'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Centered UWI logo and profile icon in the same row
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/UWI_Logo.png',
                      width: 100,
                    ),
                  ),
                ),
                // IconButton(
                //   icon: CircleAvatar(
                //     radius: 24,
                //     backgroundImage: AssetImage(
                //       'assets/images/istockphoto-1444077739-612x612.jpg',
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => StudentDetails()),
                //     );
                //   },
                // ),
              ],
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              'The Medical Sciences Library',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Medical Databases',
                style: TextStyle(
                  fontSize: 20,

                  fontFamily: "BebasNeue",
                  color: Color(0xFFD92095),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3, // 3 in a row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:
                  [
                    {
                      'image': 'assets/images/Vl1d-4Oo_400x400.png',
                      'url': 'https://pharmacylibrary.com/',
                    },
                    {
                      'image':
                          'assets/images/ebsco-ind-business-overview-cinahl-logo.jpg',
                      'url':
                          'https://research.ebsco.com/c/wh7wqj/search?defaultdb=ccm',
                    },
                    {
                      'image': 'assets/images/dentistry_database.jpg',
                      'url':
                          'https://research.ebsco.com/c/wh7wqj/search?defaultdb=ddh',
                    },
                    {
                      'image':
                          'assets/images/IMG-Micromedex-Web-Lead-015-1104x552.jpg',
                      'url':
                          'https://www.micromedexsolutions.com/home/dispatch/',
                    },
                    {
                      'image': 'assets/images/uptodatelogo3.png',
                      'url':
                          'https://www.uptodate.com/contents/search?srcsys=EZPX311562',
                    },
                    {
                      'image': 'assets/images/vetlexicon-ikona1.png',
                      'url': 'https://www.vetlexicon.com/',
                    },
                  ].map((item) {
                    return GestureDetector(
                      onTap: () async {
                        final Uri uri = Uri.parse(item['url']!);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.grey[200],
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 140,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 30),

            // Section: New Acquisitions
            const Align(
              alignment: Alignment.center,
              child: Text(
                'New Acquisitions',
                style: TextStyle(
                  fontSize: 20,

                  fontFamily: "BebasNeue",
                  color: Color(0xFFD92095),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3, // 3 in a row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio:
                  0.6, // Make the box a bit taller for book covers
              children:
                  const [
                    'assets/images/AtlasHistology.jpg',
                    'assets/images/ConciseMedicalDictionary.jpg',
                    'assets/images/ConnsCurrentTherapy.jpg',
                    'assets/images/CostofWar.jpg',
                    'assets/images/DorlandsIllustrated.jpg',
                    'assets/images/ECGmadeeasy.jpg',
                  ].map((path) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.grey[200],
                        child: Image.asset(
                          path,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 140,
                        ),
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 20),

            // Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD92095),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Navigate to the full list of new acquisitions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewAcquisitionsPage(),
                    ),
                  );
                },
                child: const Text(
                  'See Full List',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 40),
            // Add News Content text at the end of the column
            const Text(
              "News",
              style: TextStyle(
                fontSize: 20,

                fontFamily: "BebasNeue",
                color: Color(0xFFD92095),
              ),
            ),
            Column(
              children:
                  [
                    {
                      'image': 'assets/images/jan_msl_vacation.png',
                      'url':
                          'https://libraries.sta.uwi.edu/msl/images/notice/2026_Jan_MSL_Vacation_Hours.pdf',
                    },
                    {
                      'image': 'assets/images/msl_instagram.png',
                      'url':
                          'https://libraries.sta.uwi.edu/msl/images/notice/msl_instagram.png',
                    },
                    {
                      'image': 'assets/images/Thesis-Bootcamp-eflyer.jpg',
                      'url':
                          'https://libraries.sta.uwi.edu/msl/images/notice/Thesis-Bootcamp-eflyer.pdf',
                    },
                    {
                      'image': 'assets/images/fms_research.png',
                      'url':
                          'https://libraries.sta.uwi.edu/msl/images/notice/FMS_RESEARCH_DISCUSSION_SERIES_Sign_Up_Flyer.pdf',
                    },
                  ].map((item) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final Uri uri = Uri.parse(item['url']!);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              child: Image.asset(
                                item['image']!,
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: 140,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Quick Links",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "BebasNeue",
                          color: Color(0xFFD92095),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("UWISpace"),
                      Text("UWIScholar"),
                      Text("Device Loans"),
                      Text("Curbside Services"),
                      Text("Library Clearance"),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Useful Services",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "BebasNeue",
                          color: Color(0xFFD92095),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Book a Study Room"),
                      Text("Ask a Librarian"),
                      Text("Interlibrary Loan"),
                      Text("Research Consultations"),
                      Text("Workshops & Training"),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Research",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "BebasNeue",
                          color: Color(0xFFD92095),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
