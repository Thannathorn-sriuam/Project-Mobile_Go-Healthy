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
  String? _errorMessage; // ตัวแปรสถานะสำหรับข้อความผิดพลาด

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            const SizedBox(height: 25),
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
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  bool loginSuccess = false;

                  // ตรวจสอบใน Firestore
                  final querySnapshot = await FirebaseFirestore.instance
                      .collection('Member')
                      .where('account.email', isEqualTo: email)
                      .where('account.password', isEqualTo: password)
                      .get();

                  if (querySnapshot.docs.isNotEmpty) {
                    // เข้าสู่แอปเมื่อตรวจสอบถูกต้อง
                    loginSuccess = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }

                  // ข้อความผิดพลาดหากการเข้าสู่ระบบล้มเหลว
                  setState(() {
                    if (!loginSuccess) {
                      _errorMessage = 'Email or Password is incorrect';
                    } else {
                      _errorMessage = null;
                    }
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
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontFamily: 'Baloo2',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
