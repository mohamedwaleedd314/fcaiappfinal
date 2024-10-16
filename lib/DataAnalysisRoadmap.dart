import 'package:flutter/material.dart';

class DataAnalysisRoadmap extends StatefulWidget {
  @override
  _DataAnalysisRoadmapState createState() => _DataAnalysisRoadmapState();
}

class _DataAnalysisRoadmapState extends State<DataAnalysisRoadmap> {
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
        title: Text('Data Analysis Roadmap'),
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
              '1. Learn Excel & SQL',
              'These are essential tools for data analysis.',
              'Courses:\n• Coursera: "Excel Skills for Business"\n• DataCamp: "Introduction to SQL"',
              'Topics:\n• Data manipulation and functions in Excel\n• SQL queries for data retrieval',
              Colors.blue[700]!,
            ),
            _buildStepCard(
              '2. Understand Data Cleaning',
              'Learn techniques to clean messy datasets.',
              'Courses:\n• Coursera: "Data Cleaning"\n• Udacity: "Data Wrangling with MongoDB"',
              'Topics:\n• Handling missing values\n• Identifying and correcting data inconsistencies',
              Colors.green[600]!,
            ),
            _buildStepCard(
              '3. Data Visualization',
              'Learn to visualize data using tools like Power BI or Tableau.',
              'Courses:\n• Udacity: "Data Visualization with Tableau"\n• Coursera: "Data Visualization with Python"',
              'Topics:\n• Creating dashboards\n• Understanding visualization principles',
              Colors.yellow[600]!,
            ),
            _buildStepCard(
              '4. Python for Data Analysis',
              'Learn Python libraries like pandas and NumPy.',
              'Courses:\n• Coursera: "Python for Data Science and AI"\n• DataCamp: "Pandas Foundations"',
              'Topics:\n• Data manipulation with pandas\n• Numerical analysis with NumPy',
              Colors.orange[600]!,
            ),
            _buildStepCard(
              '5. Practice with Real Data',
              'Work on real-world datasets to solidify your understanding.',
              'Resources:\n• Kaggle: "Datasets"\n• UCI Machine Learning Repository',
              'Projects:\n• Conduct data analysis on public datasets\n• Participate in Kaggle competitions',
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
                    'images/Screenshot 2024-10-15 180057.png', 
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Hadley Wickham\nData analysis\nFollow him for insights on data analysis techniques and tools.',
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
