import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final String title;
  final String author;
  final String image;

  const BookDetails({
    super.key,
    required this.title,
    required this.author,
    required this.image,
  });

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'BOOK DETAILS',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'BebasNeue',
                    color: Color(0xFFD92095),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(widget.image, height: 220, fit: BoxFit.cover),
                const SizedBox(height: 24),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFD92095),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Description
                const Text(
                  'DESCRIPTION:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD92095),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Author and Year Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14),
                        children: [
                          const TextSpan(
                            text: 'AUTHOR: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD92095),
                            ),
                          ),
                          TextSpan(
                            text: widget.author,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'YEAR: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD92095),
                            ),
                          ),
                          TextSpan(
                            text: '2020',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Borrow Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle borrow logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD92095),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Borrow',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // Go Back Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    ); // This will return to the previous page in the navigation stack
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A00FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text(
                    'Go Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
