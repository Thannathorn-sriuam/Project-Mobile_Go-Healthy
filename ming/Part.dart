import 'package:flutter/material.dart';
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
                const SizedBox(height: 10),
                const Text(
                  'WANT TO TRAIN?',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                padding: const EdgeInsets.only(top: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPartContainer('Core', 'assets/core.jpg', context),
                    const SizedBox(height: 30),
                    _buildPartContainer('Arm', 'assets/arm.jpg', context),
                    const SizedBox(height: 30),
                    _buildPartContainer('Leg', 'assets/leg.jpg', context),
                    const SizedBox(height: 30),
                    _buildPartContainer('Chest', 'assets/chest.png', context),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white, size: 30.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ],
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: Container(
        width: 350,
        height: 100,
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
