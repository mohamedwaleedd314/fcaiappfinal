import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 8, 
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60, 
                backgroundImage: AssetImage('images/photo_5830104018112858306_y.jpg'), 
              ),
              SizedBox(height: 20),
              Text(
                'Mohamed Waleed',
                style: TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent, 
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Student',
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.grey[700], 
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildInfoCard(Icons.email, 'Email', 'Mohamedwaleedaly314@example.com'),
                    _buildInfoCard(Icons.phone, 'Phone Number', '01152******'),
                    _buildInfoCard(Icons.location_on, 'Location', '15 May City'),
                    _buildInfoCard(Icons.card_membership, 'ID', '2023****'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String info) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12), 
      elevation: 6, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent), 
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), 
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18, 
            color: Colors.black87, 
          ),
        ),
        subtitle: Text(
          info,
          style: TextStyle(
            fontSize: 16, 
            color: Colors.black54, 
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent), 
      ),
    );
  }
}
