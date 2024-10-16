import 'package:flutter/material.dart';

class BasicLanguagesRoadmap extends StatefulWidget {
  @override
  _BasicLanguagesRoadmapState createState() => _BasicLanguagesRoadmapState();
}

class _BasicLanguagesRoadmapState extends State<BasicLanguagesRoadmap> {
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
        title: Text('Basic Programming Languages Roadmap'),
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
              '1. Learn Python',
              'Python is an easy-to-learn language and widely used in various fields.',
              'Courses:\n• Coursera: "Python for Everybody"\n• Udemy: "Complete Python Bootcamp"',
              'Topics:\n• Variables, data types, and control structures\n• Functions and modules',
              Colors.blue[700]!,
            ),
            _buildStepCard(
              '2. Learn JavaScript',
              'JavaScript is essential for web development.',
              'Courses:\n• FreeCodeCamp: "JavaScript Algorithms and Data Structures"\n• Codecademy: "Learn JavaScript"',
              'Topics:\n• DOM manipulation\n• Asynchronous programming with callbacks and promises',
              Colors.yellow[600]!,
            ),
            _buildStepCard(
              '3. Explore C++',
              'C++ is a powerful language used in system programming and game development.',
              'Courses:\n• Udacity: "C++ Nanodegree Program"\n• Coursera: "C++ for C Programmers"',
              'Topics:\n• Pointers and memory management\n• Object-oriented programming concepts',
              Colors.green[600]!,
            ),
            _buildStepCard(
              '4. Object-Oriented Programming',
              'Learn the principles of OOP, which are crucial for most programming languages.',
              'Courses:\n• Udemy: "Object Oriented Programming in Java"\n• Coursera: "OOP in Python"',
              'Topics:\n• Classes and objects\n• Inheritance, encapsulation, and polymorphism',
              Colors.orange[600]!,
            ),
            _buildStepCard(
              '5. Data Structures and Algorithms',
              'Understand the fundamental data structures and algorithms for efficient coding.',
              'Courses:\n• LeetCode: "Data Structures and Algorithms"\n• Coursera: "Algorithms Specialization"',
              'Topics:\n• Arrays, linked lists, stacks, and queues\n• Searching and sorting algorithms',
              Colors.purple[700]!,
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
            SizedBox(height: 10),
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'images/Screenshot 2024-10-15 180415.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Eng. Osama Elzero\nProgramming Expert & Educator\nFollow her for tips on mastering programming languages!',
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
