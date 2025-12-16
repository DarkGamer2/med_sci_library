import 'package:flutter/material.dart';
import 'package:med_sci_library/settings.dart';
import 'package:med_sci_library/new_acquisitions.dart';
import 'package:med_sci_library/book_details.dart';
import 'package:med_sci_library/services.dart';
import 'package:med_sci_library/student_details.dart';
import 'package:med_sci_library/resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Sciences Library',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD92095)),
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/home': (context) => const MainScreen(),
        '/services': (context) => const ServicesPage(),
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
                IconButton(
                  icon: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'assets/images/istockphoto-1444077739-612x612.jpg',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentDetails()),
                    );
                  },
                ),
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

            // Section: Outstanding Books
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Your Outstanding Books',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    books.map((book) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BookDetails(
                                      title: book['title']!,
                                      author: book['author']!,
                                      image: book['image']!,
                                    ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              book['image']!,
                              width: 90,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            const SizedBox(height: 30),

            // Section: New Acquisitions
            const Align(
              alignment: Alignment.center,
              child: Text(
                'New Acquisitions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
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
            const Text(
              "News Content will appear here later",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),
            const Text(
              "Notices",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "BebasNeue",
                color: Color(0xFFD92095),
              ),
            ),
            const Text(
              "Notices Will appear here later",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
