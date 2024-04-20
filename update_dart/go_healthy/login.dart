import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_healthy/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Image.asset(
                'assets/images/emojione-monotone_flexed-biceps.png'),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'WELCOME BACK!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Login to your account',
            style: TextStyle(fontSize: 16),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 15.0),
          ElevatedButton(
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
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
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
