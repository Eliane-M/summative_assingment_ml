import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Removes the shadow below the AppBar
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/image_3.jpg',
            height: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('images/Illustration_1.jpg', height: 200),
                const SizedBox(height: 16),
                Text(
                  'Discover & Unlock Opportunities in the Agricultural Sector.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'A dedicated platform to connect skilled workers with employers in agriculture. '
                  'Find your perfect job match, grow your career, and support a sustainable future.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/jobSearch');
                  },
                  child: const Text('SEARCH JOBS'),
                ),
                const SizedBox(height: 8),
                // TextButton with custom text color
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                    padding: const EdgeInsets.symmetric(vertical:14, horizontal: 28),
                    foregroundColor: Colors.green,
                  ),
                  onPressed: () {},
                  child: const Text('VIEWED JOBS'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
