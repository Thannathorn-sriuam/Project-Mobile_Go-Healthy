import 'package:flutter/material.dart';
import 'package:go_healthy/home_page.dart';

import 'login.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // เปลี่ยนสีพื้นหลังเป็นสีดำ
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // color: Colors.blue,
              ),
              // นี่คือส่วนที่คุณสามารถใส่ไฟล์รูปภาพลงไป
              child: Image.asset(
                  'assets/images/emojione-monotone_flexed-biceps.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'GOOD BYE!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black, // เปลี่ยนสีของตัวหนังสือเป็นสีขาว
              ),
            ),
            Text(
              'Logout your account',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black), // เปลี่ยนสีของตัวหนังสือเป็นสีขาว
            ),
            SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Navigate back to login page
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Confirm', style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage()), // Navigate back to login page
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Cancel',  style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
