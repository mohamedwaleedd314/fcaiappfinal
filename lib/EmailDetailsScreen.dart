import 'package:flutter/material.dart';

class EmailsScreenDetails extends StatelessWidget {
  final List<Map<String, String>> professors = [
    {'name': 'Dr.ihab elkhodary', 'email': 'e.elkhodary@fci-cu.edu.eg'},
    {'name': 'Dr.Ahmed moursy', 'email': 'a.moursy@fci-cu.edu.eg'},
    {'name': 'Dr. Mohamed El-Ramly', 'email': 'm.elramly@fci-cu.edu.eg'},
    {'name': 'Dr. Dina tarek', 'email': 'D.tarek@fci-cu.edu.eg'},
    {'name': 'Dr. Sherif Zahran', 'email': 's.zahran@fci-cu.edu.eg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professors & Emails'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: professors.length,
          itemBuilder: (context, index) {
            return buildProfessorTile(
              context,
              professors[index]['name']!,
              professors[index]['email']!,
            );
          },
        ),
      ),
    );
  }

  Widget buildProfessorTile(BuildContext context, String name, String email) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        subtitle: Text(
          email,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        trailing: IconButton(
          icon: Icon(Icons.email, color: Colors.blueAccent),
          onPressed: () {
            // Soon 
          },
        ),
      ),
    );
  }
}
