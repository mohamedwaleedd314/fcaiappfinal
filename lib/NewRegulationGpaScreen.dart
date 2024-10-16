import 'package:flutter/material.dart';

class NewRegulationGpaScreen extends StatefulWidget {
  @override
  _NewRegulationGpaScreenState createState() => _NewRegulationGpaScreenState();
}

class _NewRegulationGpaScreenState extends State<NewRegulationGpaScreen> {
  final List<TextEditingController> _gradeControllers = [];
  final List<TextEditingController> _creditHourControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      _gradeControllers.add(TextEditingController());
      _creditHourControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _gradeControllers) {
      controller.dispose();
    }
    for (var controller in _creditHourControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _calculateGPA() {
    double totalPoints = 0;
    double totalCreditHours = 0;

    for (int i = 0; i < _gradeControllers.length; i++) {
      String grade = _gradeControllers[i].text;
      int creditHours = int.tryParse(_creditHourControllers[i].text) ?? 0;

      double scale = getGradeScale(grade);
      double points = scale * creditHours;

      totalPoints += points;
      totalCreditHours += creditHours;
    }

    double gpa = totalCreditHours > 0 ? totalPoints / totalCreditHours : 0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('GPA Result', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('Your GPA is: ${gpa.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  double getGradeScale(String grade) {
    switch (grade.toUpperCase()) {
      case 'A+':
        return 4.0;
      case 'A':
        return 3.7;
      case 'A-':
        return 3.4;
      case 'B+':
        return 3.2;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.8;
      case 'C+':
        return 2.6;
      case 'C':
        return 2.4;
      case 'C-':
        return 2.2;
      case 'D+':
        return 2.0;
      case 'D':
        return 1.5;
      case 'D-':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < _gradeControllers.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _gradeControllers[i],
                            decoration: InputDecoration(
                              labelText: 'Grade ${i + 1} (e.g. A, B+, etc.)',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.grade, color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _creditHourControllers[i],
                            decoration: InputDecoration(
                              labelText: 'Credit Hours',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.access_time, color: Colors.blueAccent),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateGPA,
                child: Text('Calculate GPA', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 35),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
