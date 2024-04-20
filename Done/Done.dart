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
            'GO HEALTHY',
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
            SizedBox(height: 50),
            Text(
              'Well Done',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You have comeplete',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'All exercise',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Image.asset(
                  'assets/images/correct.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 100),
            Center(
              child: InkWell(
                onTap: () {
                  // Add your action here
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
                      'BACK',
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
            SizedBox(height: 100),
            Text(
              'Press the back button to watch result.',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 18,
              ),
            ),
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
                  // Add your action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
