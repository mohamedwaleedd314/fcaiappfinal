import 'package:flutter/material.dart';

class AIRoadmap extends StatefulWidget {
  @override
  _AIRoadmapState createState() => _AIRoadmapState();
}

class _AIRoadmapState extends State<AIRoadmap> {
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
        title: Text('AI Roadmap'),
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
              '1. Mathematics',
              'Essential for AI, especially linear algebra and calculus.',
              'Courses:\n• Coursera: "Mathematics for Machine Learning"\n• Khan Academy: "Linear Algebra"',
              'Topics:\n• Understand vectors and matrices\n• Learn calculus and differential equations',
              Colors.yellow[700]!,
              Icons.calculate,
            ),
            _buildStepCard(
              '2. Statistics',
              'Study statistics, hypothesis testing, and probability.',
              'Courses:\n• Coursera: "Introduction to Statistics"\n• Udemy: "Hypothesis Testing for Data Science"',
              'Topics:\n• Understand CLT, hypothesis testing\n• Explore probability distributions',
              Colors.yellow[600]!,
              Icons.bar_chart,
            ),
            _buildStepCard(
              '3. Econometrics',
              'Learn regression, time series, and forecasting models.',
              'Courses:\n• Coursera: "Econometrics"\n• Kaggle: "Time Series Basics"',
              'Topics:\n• Work on ARIMA models\n• Time series forecasting',
              Colors.yellow[500]!,
              Icons.timeline,
            ),
            _buildStepCard(
              '4. Coding',
              'Learn programming languages like Python for AI.',
              'Courses:\n• Learn Python: "Google Python Class"\n• Leetcode: "Data Structures & Algorithms"',
              'Topics:\n• Solve algorithmic problems\n• Work on small AI projects in Python',
              Colors.blue[700]!,
              Icons.code,
            ),
            _buildStepCard(
              '5. Machine Learning',
              'Dive into machine learning algorithms and techniques.',
              'Courses:\n• Coursera: "Machine Learning by Andrew Ng"\n• Fast.ai: "Practical Deep Learning"',
              'Topics:\n• Study supervised/unsupervised learning\n• Work on real datasets from Kaggle',
              Colors.green[700]!,
              Icons.lightbulb,
            ),
            _buildStepCard(
              '6. Deep Learning',
              'Learn about advanced topics like neural networks, CNNs, and Transformers.',
              'Courses:\n• Deep Learning Specialization\nBooks:\n• "Deep Learning Book"\nPapers:\n• "Attention is All You Need"',
              'Topics:\n• Explore CNNs, RNNs, and LSTMs\n• Study Transformer models and attention mechanisms',
              Colors.deepPurple[700]!,
              Icons.memory,
            ),
            _buildStepCard(
              '7. MLOps',
              'Master deployment models and CI/CD for AI solutions.',
              'Courses:\n• "MLOps Specialization"\nArticles:\n• Continuous Integration and Continuous Deployment',
              'Topics:\n• Deployment pipelines for ML\n• Implementing scalable AI in production',
              Colors.orange[700]!,
              Icons.build_circle,
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
                    'images/Andrew Ng.jpeg', 
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Dr. Andrew Ng\nAI Researcher & Educator\nFollow her for cutting-edge insights into AI and machine learning.',
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

  Widget _buildStepCard(String title, String description, String resources, String details, Color color, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.8), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            Text(
              details,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
           
            ExpansionTile(
              title: Text('Resources', style: TextStyle(color: Colors.blueAccent, fontSize: 18)),
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
