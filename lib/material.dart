import 'package:fcaiappfinal/NewRegulationGpaScreen.dart';
import 'package:fcaiappfinal/OldRegulationGpaScreen.dart';
import 'package:flutter/material.dart';
import 'package:fcaiappfinal/CollegeDetailsScreen.dart';
import 'package:fcaiappfinal/EmailDetailsScreen.dart';

class MaterialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material'),
        backgroundColor: Colors.blueAccent, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildStylishContainer(context, 'Year 1', Colors.blue, null),
            buildStylishContainer(context, 'Year 2', Colors.green, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearDetailsScreen(year: 'Year 2')),
              );
            }),
            buildStylishContainer(context, 'Year 3', Colors.orange, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearDetailsScreen(year: 'Year 3')),
              );
            }),
            buildStylishContainer(context, 'Last Dance', Colors.pink, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearDetailsScreen(year: 'Last Dance')),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), 
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.email, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmailsScreenDetails()),
                );
              },
              
            ),
            IconButton(
              icon: Icon(Icons.school, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CollegeDetailsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(Icons.calculate, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GpaCalculatorScreen()),
          );
        },
      ),
    );
  }

  Widget buildStylishContainer(BuildContext context, String yearLabel, Color color, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130, 
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color.withOpacity(0.3)], 
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20), 
          border: Border.all(color: Colors.white.withOpacity(0.6), width: 2), 
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(
                Icons.school,
                color: Colors.white.withOpacity(0.2),
                size: 100,
              ),
            ),
            Center(
              child: Text(
                yearLabel,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YearDetailsScreen extends StatelessWidget {
  final String year;

  YearDetailsScreen({required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$year Sections'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          if (year == 'Year 2') ...buildYear2Semesters(context) 
          else ...buildDefaultSections(context), 
        ],
      ),
    );
  }

  List<Widget> buildDefaultSections(BuildContext context) {
    return [
      buildSectionTile(context, 'AI', Colors.deepPurple),
      buildSectionTile(context, 'CS', Colors.indigo),
      buildSectionTile(context, 'IT', Colors.teal),
      buildSectionTile(context, 'IS', Colors.blue),
      buildSectionTile(context, 'DS', Colors.orange),
    ];
  }

  List<Widget> buildYear2Semesters(BuildContext context) {
    return [
      buildSectionTile(context, '1st Semester', Colors.blue, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SemesterDetailsScreen(semester: '1st Semester')),
        );
      }),
      buildSectionTile(context, '2nd Semester', Colors.green, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SemesterDetailsScreen(semester: '2nd Semester')),
        );
      }),
    ];
  }

  Widget buildSectionTile(BuildContext context, String sectionName, Color color, [VoidCallback? onTap]) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        tileColor: color.withOpacity(0.2),
        title: Text(
          sectionName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: color),
        onTap: onTap,
      ),
    );
  }
}

class SemesterDetailsScreen extends StatelessWidget {
  final String semester;

  SemesterDetailsScreen({required this.semester});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$semester Subjects'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: semester == '1st Semester' ? build1stSemesterSubjects() : build2ndSemesterSubjects(),
      ),
    );
  }

  List<Widget> build1stSemesterSubjects() {
    return [
      buildSubjectTile('Math-3', Colors.blue, Icons.calculate),
      buildSubjectTile('Logic Design', Colors.green, Icons.memory),
      buildSubjectTile('Networks', Colors.red, Icons.network_check),
      buildSubjectTile('OOP', Colors.purple, Icons.code),
      buildSubjectTile('OR & DS', Colors.teal, Icons.data_usage),
      buildSubjectTile('Software Engineering', Colors.brown, Icons.developer_mode),
      buildSubjectTile('Entrepreneurship', Colors.orange, Icons.business_center),
      buildSubjectTile('Stat-2', Colors.indigo, Icons.bar_chart),
    ];
  }

  List<Widget> build2ndSemesterSubjects() {
    return [
      buildSubjectTile('Database', Colors.brown, Icons.storage),
      buildSubjectTile('Data Structure', Colors.orange, Icons.view_list),
      buildSubjectTile('Software Engineering', Colors.brown, Icons.developer_mode),
    ];
  }

  Widget buildSubjectTile(String subjectName, Color color, IconData icon) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        tileColor: color.withOpacity(0.2),
        leading: Icon(icon, color: color, size: 30), 
        title: Text(
          subjectName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: color),
      ),
    );
  }
}

class GpaCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildGpaOptionButton(context, 'Old Regulation', Colors.blue, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OldRegulationGpaScreen()),
              );
            }),
            SizedBox(height: 20),
            buildGpaOptionButton(context, 'New Regulation', Colors.green, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewRegulationGpaScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildGpaOptionButton(BuildContext context, String text, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}



