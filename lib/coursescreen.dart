import 'package:flutter/material.dart';
import 'package:fcaiappfinal/onlinecourses.dart';
import 'package:fcaiappfinal/material.dart';


class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fcai Cu app'),
        backgroundColor: Colors.blueAccent, 
      ),
      body: ListView(
        padding: EdgeInsets.all(20), 
        children: [
          ProjectCard(
            courseName: 'FCAI CU "Material"',
            description: '2024 - 2025 1st',
            Info: '',
            imagePath: 'images/th.jpeg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MaterialScreen()),
              );}, 
          ),
          ProjectCard(
            courseName: 'Roadmaps',
            description: 'Your perfect journey starts now.',
            Info: 'Invest in yourself – knowledge is the best gift you can give to your future',
            imagePath: 'images/1000_F_158470254_nfhPgmYdjLmUUKT9q2AhwLXr9Rg2eSzH.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>OnlineCourses ()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String courseName;
  final String description;
  final String Info;
  final String imagePath;
  final VoidCallback onTap;

  ProjectCard({
    required this.courseName,
    required this.description,
    required this.Info,
    required this.imagePath,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      elevation: 8, 
      margin: EdgeInsets.symmetric(vertical: 20), 
      child: InkWell( 
        onTap: onTap, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: TextStyle(
                      fontSize: 22, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10), 
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 18, 
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                   Info,
                    style: TextStyle(
                      fontSize: 18, 
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10), 
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.more_vert, color: Colors.grey[700]),
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
