import 'package:flutter/material.dart';

class CollegeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/th.jpeg'), // تأكد من أن الصورة موجودة في مجلد assets
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'FCAI CU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'About the Faculty',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'The Faculty of Computer and Artificial Intelligence offers programs designed to provide students with solid foundations in Computer Science, Information Systems, Artificial Intelligence, and Decision Support. Our mission is to equip students with the knowledge and skills needed to excel in today\'s fast-changing technological landscape.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Divider(color: Colors.blueAccent),
              SizedBox(height: 10),
              Text(
                'Programs Offered:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProgramItem('• General', '2 years program'),
                  buildProgramItem('• Computer Science (CS)', '2 years program'),
                  buildProgramItem('• Information Systems (IS)', '2 years program'),
                  buildProgramItem('• Information Technology (IT)', '2 years program'),
                  buildProgramItem('• Artificial Intelligence (AI)', '2 years program'),
                  buildProgramItem('• Decision Support (DS)', '2 years program'), // تم تغيير الاسم هنا
                ],
              ),
              SizedBox(height: 20),
              Divider(color: Colors.blueAccent),
              SizedBox(height: 10),
              Text(
                'Faculty Mission:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The faculty aims to provide high-quality education, engage in cutting-edge research, and contribute to advancements in technology both locally and globally. Our students are prepared to meet the challenges of a rapidly evolving tech-driven world.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgramItem(String program, String duration) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            program,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            duration,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
