import 'package:fcaiappfinal/coursescreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 1, 195, 229),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.19,
                color: Color.fromARGB(255, 1, 195, 229),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 0.0),
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Sign Up!',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    _buildTextField(
                      controller: idController,
                      labelText: 'ID',
                      isPassword: false,
                      icon: Icons.person,
                    ),
                    SizedBox(height: 20.0),
                    _buildTextField(
                      controller: emailController,
                      labelText: 'Email Address',
                      isPassword: false,
                      icon: Icons.email,
                    ),
                    SizedBox(height: 20.0),
                    _buildTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      isPassword: true,
                      icon: Icons.lock,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text('I accept the policy and terms'),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 1, 195, 229),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_validateID(idController.text) && _validateEmail(emailController.text)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fix the errors before proceeding.'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton('images/icons8-linkedin-64.png', () {}),
                        _buildSocialButton('images/icons8-facebook-64.png', () {}),
                        _buildSocialButton('images/icons8-google-48.png', () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isPassword,
    String? errorText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: isPassword ? 'Enter your password' : 'Enter your $labelText',
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.grey.shade100,
        errorText: errorText,
        prefixIcon: Icon(icon, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color.fromARGB(255, 1, 195, 229), width: 2),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath, VoidCallback onTap) {
    return IconButton(
      icon: Image.asset(assetPath),
      iconSize: 48.0,
      onPressed: onTap,
    );
  }

  bool _validateID(String id) {
    final RegExp regex = RegExp(r'^20\d{6}$');
    return regex.hasMatch(id);
  }

  bool _validateEmail(String email) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 40);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - 80, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
