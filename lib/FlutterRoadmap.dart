import 'package:flutter/material.dart';

class FlutterRoadmap extends StatefulWidget {
  @override
  _FlutterRoadmapState createState() => _FlutterRoadmapState();
}

class _FlutterRoadmapState extends State<FlutterRoadmap> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Roadmap'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTopInstructorSection(),
            SizedBox(height: 16),
            _buildStepCard(
              '1. Learn Dart Basics',
              'Before diving into Flutter, learn the basics of the Dart programming language.',
              'Resources:\n• Dart Official Documentation\n• Udacity: "Intro to Dart"',
              'Topics:\n• Variables, Data Types, Functions\n• Object-Oriented Programming',
              Colors.blue[700]!,
            ),
            _buildStepCard(
              '2. Introduction to Flutter Widgets',
              'Widgets are the building blocks of Flutter applications.',
              'Resources:\n• Flutter Official Documentation\n• Coursera: "Building Apps with Flutter"',
              'Topics:\n• Stateless and Stateful Widgets\n• Layouts and UI Design',
              Colors.green[600]!,
            ),
            _buildStepCard(
              '3. State Management',
              'Learn about state management techniques like Provider, Riverpod, etc.',
              'Resources:\n• YouTube: "Flutter State Management"\n• Official Flutter Docs: "State Management"',
              'Topics:\n• Local and Global State Management\n• BLoC Pattern',
              Colors.yellow[600]!,
            ),
            _buildStepCard(
              '4. Navigation & Routing',
              'Learn to navigate between pages in Flutter.',
              'Resources:\n• Flutter Official Docs: "Navigation"\n• YouTube: "Flutter Navigation & Routing"',
              'Topics:\n• Named Routes\n• Passing Data Between Pages',
              Colors.orange[600]!,
            ),
            _buildStepCard(
              '5. Work on Projects',
              'Start building simple apps like to-do lists or weather apps.',
              'Resources:\n• GitHub: "Flutter Projects"\n• YouTube: "Build Flutter Apps"',
              'Projects:\n• BMI calculator\n• Menu app',
              Colors.purple[700]!,
            ),
            _buildStepCard(
              '6. Working with APIs',
              'Learn how to fetch and handle data from REST APIs in Flutter.',
              'Resources:\n• Flutter Official Docs: "Networking"\n• YouTube: "Flutter API Integration"',
              'Topics:\n• HTTP package\n• JSON parsing and serialization',
              Colors.teal[600]!,
            ),
            _buildStepCard(
              '7. Firebase Integration',
              'Integrate Firebase for backend services like authentication and database.',
              'Resources:\n• Firebase Official Documentation\n• YouTube: "Flutter & Firebase"',
              'Topics:\n• Firebase Authentication\n• Cloud Firestore and Realtime Database',
              Colors.deepOrange[600]!,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopInstructorSection() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Instructor',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 0),
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'images/Screenshot 2024-10-15 184833.png', 
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Angela Yu\nFlutter Expert & Educator\nFollow him for the latest tips and tricks in Flutter development.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(String title, String description, String resources, String details, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Text(
              details,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text('Resources', style: TextStyle(color: Colors.blueAccent)),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    resources,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
