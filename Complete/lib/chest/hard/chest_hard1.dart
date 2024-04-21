import 'package:flutter/material.dart';

import '../../Done.dart';
import '../../calories_helper.dart';
import '../../home_page.dart';

// void main() {
//   runApp(GoHealthy());
// }

class chest_hard extends StatelessWidget {
  const chest_hard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TRAINING',
          style: TextStyle(
            fontFamily: 'Baloo',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Image.asset('assets/gif/chest/hard1.gif'), // ใช้ GIF แทนภาพปก
          ),
          SizedBox(height: 10),
          Text(
            'Overhead Triceps Extension',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'X 15',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.blueAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Press the next button to continue.',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // จัดการเหตุการณ์เมื่อกดปุ่ม Home
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TRAINING',
          style: TextStyle(
            fontFamily: 'Baloo',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Image.asset('assets/gif/chest/hard2.gif'), // ใช้ GIF แทนภาพปก
          ),
          SizedBox(height: 10),
          Text(
            'Chest Press',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'X 20',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.blueAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Press the next button to continue.',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // จัดการเหตุการณ์เมื่อกดปุ่ม Home
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TRAINING',
          style: TextStyle(
            fontFamily: 'Baloo',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Image.asset('assets/gif/chest/hard3.gif'), // ใช้ GIF แทนภาพปก
          ),
          SizedBox(height: 10),
          Text(
            'Frog Pump',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'X 15',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.blueAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: InkWell(
              onTap: () {
                // อาจจะใส่การทำงานเพิ่มเติมหรือเปลี่ยนหน้าไปหน้าอื่นได้ตามต้องการ
                Navigator.push(context, MaterialPageRoute(builder: (context) => done_page()));
                CaloriesHelper.addCalories(30);
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'FINISH',
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Press the finish button to complete training.',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // จัดการเหตุการณ์เมื่อกดปุ่ม Home
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
