import 'package:flutter/material.dart';
import 'package:med_sci_library/components/notice_widget.dart';
import 'package:med_sci_library/services/notice_service.dart';
import 'package:med_sci_library/models/notice.dart';
import 'package:med_sci_library/settings.dart' hide ThemeController;
import 'package:med_sci_library/new_acquisitions.dart';
import 'package:med_sci_library/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:med_sci_library/resources.dart';
import 'package:med_sci_library/theme/controller.dart';
import 'package:med_sci_library/quick_links.dart';
import 'package:med_sci_library/search.dart';
import 'package:med_sci_library/store_search_logic.dart';

final Uri _quicklink1 = Uri.parse(
  'https://libraries.sta.uwi.edu/msl/images/notice/AssociateCI_Preceptors_v4.png',
);
final Uri _quicklink2 = Uri.parse(
  'https://uwin-primo.hosted.exlibrisgroup.com/primo-explore/search?vid=STA&lang=en_US&fromRedirectFilter=true',
);
final Uri _quicklink3 = Uri.parse('https://uwispace.sta.uwi.edu/home');
final Uri _quicklink4 = Uri.parse('https://uwischolar.sta.uwi.edu/');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: const MyApp(),
    ),
  );
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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
          routes: {
            '/settings': (context) => const SettingsPage(),
            '/search': (context) => const Search(),
            '/home': (context) => const MainScreen(),
            '/services': (context) => const ServicesPage(),
            '/resources': (context) => const Resources(),
          },
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Search(),
    const Resources(),
    const ServicesPage(),
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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFD92095),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Notice>> _noticesFuture;
  final NoticeService _noticeService = NoticeService();

  @override
  void initState() {
    super.initState();
    _noticesFuture = _noticeService.fetchNotices();
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/UWI_Logo.png', width: 100),
            ),
            const SizedBox(height: 20),
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
            _buildSectionTitle('Medical Databases'),
            const SizedBox(height: 12),
            _buildDatabaseGrid(),
            const SizedBox(height: 30),
            _buildSectionTitle('New Acquisitions'),
            const SizedBox(height: 12),
            _buildAcquisitionsGrid(),
            const SizedBox(height: 20),
            _buildFullListButton(context),
            const SizedBox(height: 40),
            _buildSectionTitle('News'),
            const SizedBox(height: 12),
            _buildNoticesSection(),
            const SizedBox(height: 40),

            // Fixed Footer Section
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                return GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 30,
                    childAspectRatio: constraints.maxWidth > 600 ? 0.65 : 0.7,
                  ),
                  children: [
                    _buildFooterColumn(context, "Quick Links", [
                      _buildLink(
                        "Instructors & Preceptors",
                        () => _launchUrl(_quicklink1),
                      ),
                      _buildLink("UWIlinc", () => _launchUrl(_quicklink2)),
                      _buildLink("UWIspace", () => _launchUrl(_quicklink3)),
                      _buildLink("UWIScholar", () => _launchUrl(_quicklink4)),
                    ]),
                    _buildFooterColumn(context, "Research Help", [
                      const Text("Research Guides"),
                      const Text("Ask A Librarian"),
                      const Text("FAQs"),
                      const Text("Using UWILinC"),
                    ]),
                    _buildFooterColumn(context, "Services", [
                      const Text("Reference"),
                      const Text("Loan & Fines"),
                      const Text("Printing"),
                      const Text("IT Lab Access"),
                    ]),
                    _buildFooterColumn(context, "Useful Links", [
                      const Text("FMS Faculty"),
                      const Text("Medicine"),
                      const Text("Nursing"),
                      const Text("Dentistry"),
                    ]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: "BebasNeue",
        color: Color(0xFFD92095),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDatabaseGrid() {
    final List<Map<String, String>> dbs = [
      {
        'image': 'assets/images/Vl1d-4Oo_400x400.png',
        'url': 'https://pharmacylibrary.com/',
      },
      {
        'image': 'assets/images/ebsco-ind-business-overview-cinahl-logo.jpg',
        'url': 'https://research.ebsco.com/c/wh7wqj/search?defaultdb=ccm',
      },
      {
        'image': 'assets/images/dentistry_database.jpg',
        'url': 'https://research.ebsco.com/c/wh7wqj/search?defaultdb=ddh',
      },
      {
        'image': 'assets/images/IMG-Micromedex-Web-Lead-015-1104x552.jpg',
        'url': 'https://www.micromedexsolutions.com/home/dispatch/',
      },
      {
        'image': 'assets/images/uptodatelogo3.png',
        'url': 'https://www.uptodate.com/contents/search?srcsys=EZPX311562',
      },
      {
        'image': 'assets/images/vetlexicon-ikona1.png',
        'url': 'https://www.vetlexicon.com/',
      },
    ];

    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:
          dbs
              .map(
                (item) => GestureDetector(
                  onTap: () => _launchUrl(Uri.parse(item['url']!)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(item['image']!, fit: BoxFit.cover),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildAcquisitionsGrid() {
    final images = [
      'assets/images/AtlasHistology.jpg',
      'assets/images/ConciseMedicalDictionary.jpg',
      'assets/images/ConnsCurrentTherapy.jpg',
      'assets/images/CostofWar.jpg',
      'assets/images/DorlandsIllustrated.jpg',
      'assets/images/ECGmadeeasy.jpg',
    ];

    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      childAspectRatio: 0.7,
      physics: const NeverScrollableScrollPhysics(),
      children:
          images
              .map(
                (path) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(path, fit: BoxFit.cover),
                ),
              )
              .toList(),
    );
  }

  Widget _buildFullListButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD92095),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewAcquisitionsPage(),
            ),
          ),
      child: const Text('See Full List', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildNoticesSection() {
    return FutureBuilder<List<Notice>>(
      future: _noticesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return const Text("Error loading news");
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder:
              (context, index) => NoticeWidget(notice: snapshot.data![index]),
        );
      },
    );
  }

  Widget _buildFooterColumn(
    BuildContext context,
    String title,
    List<Widget> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: "BebasNeue",
            color: Color(0xFFD92095),
          ),
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 12,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black87,
              ),
              child: item,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuickLinks()),
                ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD92095),
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "See More",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLink(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}
