import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_healthy/home_page.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Image.asset('assets/logo.png'),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'WELCOME BACK!',
            style: TextStyle(fontSize: 32, fontFamily: 'Baloo'),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Login to your account',
              style: TextStyle(fontSize: 16, fontFamily: 'Baloo2'),
            ),
          ),
          SizedBox(
            width: 300, // Set the desired width here
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true, // Enable filled background
                fillColor: Colors.grey[200], // Set the fill color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Optional: rounded corners
                  borderSide: BorderSide.none, // No border
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 0,
                ), // Padding inside the TextField
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300, // Set the desired width here
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true, // Enable filled background
                fillColor: Colors.grey[200], // Set the fill color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Optional: rounded corners
                  borderSide: BorderSide.none, // No border
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 0,
                ), // Padding inside the TextField
              ),
          ),
          ),
          const SizedBox(height: 35),
          // Wrap the ElevatedButton with a SizedBox
          SizedBox(
            width: 150, // Set the desired width here
            child: ElevatedButton(
              onPressed: () {
                // Check login credentials
                final email = _emailController.text;
                final password = _passwordController.text;

                // ตรวจสอบใน Firestore
                FirebaseFirestore.instance
                    .collection('Member')
                    .get()
                    .then((snapshot) {
                  snapshot.docs.forEach((doc) {
                    final memberData = doc.data();
                    if (memberData['account']['email'] == email &&
                        memberData['account']['password'] == password) {
                      // เข้าสู่แอป EcerciseApp() เมื่อตรวจสอบถูกต้อง
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Baloo', fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
