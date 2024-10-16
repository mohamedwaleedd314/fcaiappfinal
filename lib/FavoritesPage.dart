import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<String> favoriteCourses;

  FavoritesPage({required this.favoriteCourses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Courses'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: favoriteCourses.length,
          itemBuilder: (context, index) {
            return _buildFavoriteCourseCard(favoriteCourses[index]);
          },
        ),
      ),
    );
  }

  Widget _buildFavoriteCourseCard(String title) {
    String imagePath = _getImagePathForCourse(title);
    Color color = _getColorForCourse(title);
    int coursesCount = _getCoursesCountForCourse(title);

    return GestureDetector(
      onTap: () {
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
                      '$coursesCount courses',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getImagePathForCourse(String title) {
    switch (title) {
      case 'AI':
        return 'images/th (1).jpeg';
      case 'Data Analysis':
        return 'images/28f62e1d6a2bde1e6ac0ae86b7d008df.jpg';
      case 'Flutter':
        return 'images/f99059c9960fb3a114dadf078146127c.jpg';
      case 'Basic Languages':
        return 'images/th (4).jpeg';
      case 'Web':
        return 'images/th (2).jpeg';
      case 'Problem Solving':
        return 'images/header-1.webp';
      case 'Cyber Security':
        return 'images/th (3).jpeg';
      case 'Digital Marketing':
        return 'images/digital-marketing.jpg';
      default:
        return 'images/default.jpg'; 
    }
  }

  Color _getColorForCourse(String title) {
    switch (title) {
      case 'AI':
        return Colors.blue;
      case 'Data Analysis':
        return Colors.red;
      case 'Flutter':
        return Color.fromARGB(39, 0, 27, 4);
      case 'Basic Languages':
        return Colors.purple;
      case 'Web':
        return Color.fromARGB(255, 64, 2, 75);
      case 'Problem Solving':
        return Color.fromARGB(255, 17, 44, 1);
      case 'Cyber Security':
        return Colors.purple;
      case 'Digital Marketing':
        return Colors.purple;
      default:
        return Colors.grey; 
    }
  }

  int _getCoursesCountForCourse(String title) {
    switch (title) {
      case 'AI':
      case 'Flutter':
      case 'Basic Languages':
        return 7; 
      case 'Data Analysis':
        return 5;
      case 'Web':
      case 'Problem Solving':
      case 'Cyber Security':
      case 'Digital Marketing':
        return 15; 
      default:
        return 0; 
    }
  }
}
