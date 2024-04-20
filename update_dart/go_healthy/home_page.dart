// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_healthy/info.dart';

// import 'Training.dart';
// import 'Calories.dart';
// import 'History.dart';
// import 'Timer.dart';
import 'logout.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? fname;

  @override
  void initState() {
    super.initState();
    // เรียกใช้ getFirstName และรับ Future กลับมา
    FirebaseDataHandler().getFirstName('memberId').then((value) {
      setState(() {
        fname = value; // อัพเดตค่า fname เมื่อมีค่าถูกส่งคืนมา
      });
    });
  }

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
                // Add onPressed functionality here if needed
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

class FirebaseDataHandler {
  Future<String?> getFirstName(String memberId) async {
    // ดึงข้อมูลจาก Firestore
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('Member')
        .doc(memberId)
        .get();

    // ประกาศตัวแปร local เพื่อเก็บชื่อ
    String? fname;

    // ตรวจสอบว่ามีข้อมูลหรือไม่
    if (snapshot.exists) {
      // ดึงข้อมูลจากฟิลด์ 'account.f_name' แล้วเก็บไว้ในตัวแปร local
      fname = snapshot.data()?['account']['f_name'];
    }

    // ส่งค่า fname กลับ
    return fname;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseDataHandler _firebaseDataHandler = FirebaseDataHandler();
  String? fname;

  @override
  void initState() {
    super.initState();
    _fetchFName();
  }

  Future<void> _fetchFName() async {
    String? fName = await _firebaseDataHandler.getFirstName('memberId');
    setState(() {
      fname = fName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Hello, ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Baloo',
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                //  if (fname2 != null)
                Text(
                  'Tan',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Baloo',
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const Training()),
                                  // );
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
                                            'assets/images/exercise.png',
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => Calories()),
                                  // );
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
                                            'assets/images/mode_heat.png',
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => History()),
                                  // );
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => TimerPage()),
                                  // );
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
                  const SizedBox(
                    height: 60,
                  ),
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
                                                170), // Adjust spacing between icon and text
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
