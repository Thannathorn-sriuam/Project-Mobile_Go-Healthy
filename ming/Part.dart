import 'package:flutter/material.dart';
import 'package:go_healthy/level_arm.dart';
import 'package:go_healthy/level_chest.dart';
import 'package:go_healthy/level_core.dart';
import 'package:go_healthy/level_leg.dart';
import 'package:go_healthy/home_page.dart';

void main() {
  runApp(const Part());
}

class Part extends StatelessWidget {
  const Part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'TRAINING',
            style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'WHICH PART DO YOU',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                // const SizedBox(height: 10),
                const Text(
                  'WANT TO TRAIN?',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Please select your part',
                    style: TextStyle(fontFamily: 'Baloo', fontSize: 16.0),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPartContainer('Core', 'assets/core.jpg', context),
                    const SizedBox(height: 20),
                    _buildPartContainer('Arm', 'assets/arm.jpg', context),
                    const SizedBox(height: 20),
                    _buildPartContainer('Leg', 'assets/leg.jpg', context),
                    const SizedBox(height: 20),
                    _buildPartContainer('Chest', 'assets/chest.png', context),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.black,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: const Center(
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPartContainer(
      String partName, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (partName == 'Core') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => level_core()), // Navigate to Core page
          );
        } else if (partName == 'Arm') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => level_arm()), // Navigate to Core page
          );
        } else if (partName == 'Leg') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => level_leg()),
          );
        } else if (partName == 'Chest') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => level_chest()), // Navigate to Core page
          );
        }
      },
      child: Container(
        width: 320,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 350,
                height: 100,
                fit: BoxFit.cover,
              ),
              Text(
                partName,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Baloo',
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
