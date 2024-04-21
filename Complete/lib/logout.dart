import 'package:flutter/material.dart';
import 'package:go_healthy/home_page.dart';

import 'login.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white, // เปลี่ยนสีพื้นหลัง
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                // color: Colors.blue,
              ),
              // นี่คือส่วนที่คุณสามารถใส่ไฟล์รูปภาพลงไป
              child: Image.asset(
                  'assets/logo.png'),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'GOOD BYE!',
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'Baloo',
                color: Colors.black,
              ),
            ),
            const Text(
              'Logout your account',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Baloo2',
                  color: Colors.black),
            ),
            const SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginPage()), // Navigate back to login page
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Confirm', 
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Baloo',
                  color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage()), // Navigate back to login page
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Cancel',  
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Baloo',
                  color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
