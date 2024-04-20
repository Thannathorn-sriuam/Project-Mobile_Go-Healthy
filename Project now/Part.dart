import 'package:flutter/material.dart';

void main() {
  runApp(GoHealthy());
}

class GoHealthy extends StatelessWidget {
  const GoHealthy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'TRAINING',
            style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {},
          ),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'WHICH PART DO YOU',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'WANT TO TRAIN?',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Please select your part',
                    style: TextStyle(fontFamily: 'Baloo', fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 380),
              bottom: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 350,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/core.jpg',
                            width: 349,
                            height: 99,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.0),
                        child: Center(
                          child: Text(
                            'Core',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Baloo',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildPartContainer('Arm', 'assets/images/arm.jpg'),
                  SizedBox(height: 20),
                  _buildPartContainer('Leg', 'assets/images/leg.jpg'),
                  SizedBox(height: 20),
                  _buildPartContainer('Chest', 'assets/images/chest.png'),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white, size: 30.0),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPartContainer(String partName, String imagePath) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: 360,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            partName,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Baloo',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}