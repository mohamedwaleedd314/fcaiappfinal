import 'package:fcaiappfinal/Profilepage.dart';
import 'package:flutter/material.dart';
import 'package:fcaiappfinal/FavoritesPage.dart'; 
import 'package:fcaiappfinal/AIRoadmap.dart';
import 'package:fcaiappfinal/BasicLanguagesRoadmap.dart';
import 'package:fcaiappfinal/DataAnalysisRoadmap.dart';
import 'package:fcaiappfinal/FlutterRoadmap.dart';
import 'package:fcaiappfinal/Profilepage.dart';

class OnlineCourses extends StatefulWidget {
  @override
  _OnlineCoursesState createState() => _OnlineCoursesState();
}

class _OnlineCoursesState extends State<OnlineCourses> {
  List<String> favoriteCourses = []; 
  int _selectedIndex = 0; 

  void toggleFavorite(String course) {
    setState(() {
      if (favoriteCourses.contains(course)) {
        favoriteCourses.remove(course);
      } else {
        favoriteCourses.add(course);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: 
        break; 
      case 1: 
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavoritesPage(favoriteCourses: favoriteCourses),
          ),
        );
        break;
      case 2:
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage()),
  );
  break;  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Online Courses'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24),
              _buildCategoryTabs(),
              SizedBox(height: 16),
              Expanded(child: _buildProgrammingCoursesGrid(context)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Today is a great day to learn!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTabItem('Top', isActive: true),
          SizedBox(width: 16),
          _buildTabItem('AI'),
          SizedBox(width: 16),
          _buildTabItem('Data Analysis'),
          SizedBox(width: 16),
          _buildTabItem('Flutter'),
          SizedBox(width: 16),
          _buildTabItem('Basic Languages'),
          SizedBox(width: 16),
          Icon(Icons.filter_list, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, {bool isActive = false}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: isActive ? Colors.black : Colors.grey[500],
      ),
    );
  }

  Widget _buildProgrammingCoursesGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 26,
      childAspectRatio: 3 / 2,
      children: [
        _buildCourseCard(context, 'AI', 7, Colors.blue, 'images/th (1).jpeg'),
        _buildCourseCard(context, 'Data Analysis', 5, Colors.red, 'images/28f62e1d6a2bde1e6ac0ae86b7d008df.jpg'),
        _buildCourseCard(context, 'Flutter', 7, Color.fromARGB(39, 0, 27, 4), 'images/f99059c9960fb3a114dadf078146127c.jpg'),
        _buildCourseCard(context, 'Basic Languages', 5, Colors.purple, 'images/th (4).jpeg'),
        _buildCourseCard(context, 'Web', 15, Color.fromARGB(255, 64, 2, 75), 'images/th (2).jpeg'),
        _buildCourseCard(context, 'Problem Solving', 15, Color.fromARGB(255, 17, 44, 1), 'images/header-1.webp'),
        _buildCourseCard(context, 'Cyber Security', 15, Colors.purple, 'images/th (3).jpeg'),
        _buildCourseCard(context, 'Digital Marketing', 15, Colors.purple, 'images/digital-marketing.jpg'),
      ],
    );
  }

  Widget _buildCourseCard(BuildContext context, String title, int courses, Color color, String imagePath) {
    bool isFavorite = favoriteCourses.contains(title);

    return GestureDetector(
      onTap: () {
        if (title == 'AI') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AIRoadmap()));
        } else if (title == 'Data Analysis') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DataAnalysisRoadmap()));
        } else if (title == 'Flutter') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterRoadmap()));
        } else if (title == 'Basic Languages') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BasicLanguagesRoadmap()));
        }
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(color.withOpacity(0.3), BlendMode.darken),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.book, size: 16, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      '$courses courses',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: isFavorite ? Colors.red : Colors.white,
              onPressed: () => toggleFavorite(title),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
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
