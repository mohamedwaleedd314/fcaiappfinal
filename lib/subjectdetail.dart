import 'package:flutter/material.dart';
class SubjectDetailScreen extends StatelessWidget {
  final String subject;

  SubjectDetailScreen({required this.subject});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subject Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Details for $subject coming soon!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}