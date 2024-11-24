import 'package:flutter/material.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Center(
              child: Text(
                'SEARCH FOR JOBS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Subtitle
            Center(
              child: Text(
                'Find your perfect job match, grow your career, and support a sustainable future.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Job Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Salary'),
                            Slider(
                              value: 50000,
                              min: 0,
                              max: 100000,
                              divisions: 5,
                              label: '\$50000',
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Experience'),
                            Slider(
                              value: 3,
                              min: 0,
                              max: 10,
                              divisions: 5,
                              label: '3 years',
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const JobCard(
                    companyName: 'AgroTech Inc.',
                    position: 'Farm Manager',
                    location: 'Rwanda',
                    imagePath: 'assets/farm1.jpg',
                  ),
                  const SizedBox(height: 16),
                  const JobCard(
                    companyName: 'GreenFields Ltd.',
                    position: 'Agriculture Consultant',
                    location: 'Kenya',
                    imagePath: 'assets/farm2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String companyName;
  final String position;
  final String location;
  final String imagePath;

  const JobCard({super.key, 
    required this.companyName,
    required this.position,
    required this.location,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          Image.asset(imagePath, height: 80, width: 80, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(position, style: TextStyle(color: Colors.grey[700])),
              Text(location, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        ],
      ),
    );
  }
}
