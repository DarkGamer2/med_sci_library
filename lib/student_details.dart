import "package:flutter/material.dart";

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                const Text(
                  "YOUR PROFILE",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: "BebasNeue",
                    color: Color(0xFFD92095),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/images/istockphoto-1444077739-612x612.jpg',
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "812345678",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Student",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(height: 4),
                const Text(
                  "john.doe@uwi.edu",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD92095),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: const Text("Close"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
