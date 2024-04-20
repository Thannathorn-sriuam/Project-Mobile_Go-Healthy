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
            'LEG',
            style: TextStyle(fontFamily: 'Baloo',color: Colors.white, fontWeight: FontWeight.bold),
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
                  'WHICH LEVEL DO YOU',
                  style: TextStyle(fontFamily: 'Baloo',fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'WANT TO TRAIN?',
                  style: TextStyle(fontFamily: 'Baloo',fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Please select your level',
                    style: TextStyle(fontFamily: 'Baloo',fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width -414),
              bottom: MediaQuery.of(context).size.height *
                  0.05, // ปรับค่าตามความต้องการ
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 416,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 146, 221, 149),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.green, // สีขอบ
                          width: 2, // ความหนาของเส้นขอบ
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Easy',
                        style: TextStyle(
                            color: const Color.fromARGB(224, 76, 175, 79),fontFamily: 'Baloo',fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 416,
                    height: 120,
                    decoration: BoxDecoration(
                    color: Color.fromARGB(255, 196, 185, 86),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.yellow,
                        width: 2,
                      ),
                    ),
                    ),
                    child: Center(
                      child: Text(
                        'Medium',
                        style: TextStyle(
                            color: Color.fromARGB(255, 149, 142, 69),fontFamily: 'Baloo',fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 416,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 115, 108),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Hard',
                        style: TextStyle(
                            color:  const Color.fromARGB(255, 196, 48, 37),fontFamily: 'Baloo',fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
}
