import 'package:flutter/material.dart';
import 'package:go_healthy/Part.dart';
import 'package:go_healthy/calendar_page.dart';
import 'Calories.dart';
import 'Timer.dart';
import 'info.dart';
import 'logout.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(const HomePage());
// }

void main() async {
  // เริ่มต้น Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Go Healthy",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Baloo',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => info()));
              },
            ),
          ],
        ),
        body: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ฟังก์ชันที่จะดึงชื่อผู้ใช้งานจาก Firestore
  Future<String> getUserName() async {
      // Fetch user data from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Member')
          .doc('94KYTVacCEDAsNt4kvE3') // Replace with the appropriate document ID
          .get();

      // Check if the snapshot has data
      if (snapshot.exists && snapshot.data() != null) {
          // Retrieve user_name field from the snapshot
          var userNameData = snapshot['user_name'];

          // Check if userNameData is a Map
          if (userNameData != null && userNameData is Map) {
              // Retrieve the f_name field from the userNameData map
              String? fName = userNameData['f_name'] as String?;
              // Return fName if it is not null, otherwise return an empty string or a default value
              return fName ?? '';
          }
      }
      // Return an empty string or a default value if the document doesn't exist or data is missing
      return '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            FutureBuilder<String>(
              future: getUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // รอข้อมูล
                } else if (snapshot.hasError) {
                  return Text(
                      'Error: ${snapshot.error}'); // แสดงข้อความข้อผิดพลาด
                } else {
                  // ข้อมูลถูกดึงสำเร็จ
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        'Hello, ${snapshot.data}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Baloo',
                          fontSize: 25,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Table(
                      border: TableBorder.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: InkWell(
                                onTap: () {
                                  // Define your navigation here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Part()),
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Image.asset(
                                            'assets/exercise.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Training',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Baloo',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Text(
                                                'Choose to exercise as you like.',
                                                style: TextStyle(
                                                  fontFamily: 'Baloo',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () {
                                  // Define your navigation here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Calories()),
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Image.asset(
                                            'assets/mode_heat.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Calories',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Baloo',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Text(
                                                'Calculate how many calories you burned today.',
                                                style: TextStyle(
                                                  fontFamily: 'Baloo',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: InkWell(
                                onTap: () {
                                  // Define your navigation here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(
                                            Icons.calendar_month_outlined,
                                            size: 40,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'History',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Baloo',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Text(
                                                'Check which days you exercise.',
                                                style: TextStyle(
                                                  fontFamily: 'Baloo',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () {
                                  // Define your navigation here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TimerPage()),
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(
                                            Icons.timer_outlined,
                                            size: 40,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Timer',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Baloo',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Text(
                                                'Count time for your various activities.',
                                                style: TextStyle(
                                                  fontFamily: 'Baloo',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: InkWell(
                      onTap: () {
                        // Add functionality for when the table row is clicked
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogOut()));
                      },
                      child: Table(
                        border: TableBorder.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  height: 70,
                                  child: const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Logout',
                                          style: TextStyle(
                                            fontFamily: 'Baloo',
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                180), // Adjust spacing between icon and text
                                        Icon(
                                          Icons.logout,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
