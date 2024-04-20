import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_healthy/home_page.dart';
// import 'main.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(info());
// }

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoPage(),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FirestoreData(),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      title: Text(
        'GO HEALTHY',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class FirestoreData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Member").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<DocumentSnapshot> documents = snapshot.data?.docs ?? [];
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var doc = documents[index];
            var BMI = doc['BMI'] as Map<String, dynamic>;
            var account = doc['account'] as Map<String, dynamic>;
            var age = doc['age'] as int;
            var phoneNum = doc['phone_num'] as String;
            var userName = doc['user_name'] as Map<String, dynamic>;

            var high = BMI['high'] as num;
            var weight = BMI['weight'] as num;

            var email = account['email'] as String?;

            var fName = userName['f_name'] as String?;
            var lName = userName['l_name'] as String?;

            return Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        // นี่คือส่วนที่คุณสามารถใส่ไฟล์รูปภาพลงไป
                        child: Image.asset('assets/images/TanProfile.jpg', fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '$fName $lName',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBox(width: 15),
                                    Text('$email',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(width: 15),
                                    Text('$phoneNum',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Icon(Icons.cake),
                                    SizedBox(width: 15),
                                    Text('$age',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Icon(Icons.height),
                                    SizedBox(width: 15),
                                    Text('$high cm',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Icon(Icons.fitness_center),
                                    SizedBox(width: 15),
                                    Text('$weight kg',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {});

    // ใส่การเปลี่ยนหน้าของแอปตาม index ที่เลือก
    switch (index) {
      case 0:
        Navigator.of(context).pop();
        break;
      case 1:
        // สามารถเปลี่ยนเป็นหน้าหลักของแอปได้ตามต้องการ
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // จัดตำแหน่งแนวนอนตรงกลาง
          children: <Widget>[
            Expanded(
              // ทำให้ปุ่ม home รับพื้นที่ทั้งหมด
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // จัดตำแหน่งแนวตั้งตรงกลาง
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white, size: 30.0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
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
