import 'package:flutter/material.dart';
import 'package:fcaiappfinal/coursescreen.dart'; 

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(fontSize: 20),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 0.0),
                    const Text(
                      'Welcome Back,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Log In!',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 120.0),
                    _buildTextField(
                      controller: _emailController,
                      labelText: 'ID',
                      isPassword: false,
                    ),
                    const SizedBox(height: 20.0),
                    _buildTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      isPassword: true,
                      showPassword: () {
                        _isPasswordVisible = !_isPasswordVisible; 
                        (context as Element).markNeedsBuild();
                      },
                      isPasswordVisible: _isPasswordVisible,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text('Remember me'),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Color.fromARGB(255, 1, 195, 229)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 1, 195, 229),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_validateInput()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CourseScreen()),
                          );
                        } else {
                          _showErrorDialog(context);
                        }
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const Center(child: Text('OR', style: TextStyle(fontSize: 16))),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSocialButton('images/icons8-linkedin-64.png', () {
                        }),
                        _buildSocialButton('images/icons8-facebook-64.png', () {
                        }),
                        _buildSocialButton('images/icons8-google-48.png', () {
                        }),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: const Text(
                          'Sign in with another account',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 195, 229),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 110.0),
                    const Center(
                      child: Text(
                        'Keep pushing your limits!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 195, 229),
                        ),
                      ),
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

  bool _validateInput() {
    final idRegex = RegExp(r'^20\d{6}$'); 
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$'); 
    final id = _emailController.text;
    final password = _passwordController.text;

    return idRegex.hasMatch(id) && passwordRegex.hasMatch(password);
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter a valid ID and password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isPassword,
    VoidCallback? showPassword,
    bool? isPasswordVisible,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !(isPasswordVisible ?? false),
      style: TextStyle(color: Colors.black, fontSize: 16), 
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible == true ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: showPassword,
              )
            : Icon(Icons.person, color: Colors.grey), 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color.fromARGB(255, 1, 195, 229), width: 2), 
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade300, width: 1.5), 
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2), 
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
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
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
