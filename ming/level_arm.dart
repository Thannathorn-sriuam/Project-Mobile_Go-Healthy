import 'package:flutter/material.dart';
import 'Done.dart';
import 'home_page.dart';

void main() {
  runApp(const level_arm());
}

class level_arm extends StatelessWidget {
  const level_arm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Arm',
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
                  'WHICH LEVEL DO YOU',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                // const SizedBox(height: 10),
                const Text(
                  'WANT TO TRAIN?',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Please select your level',
                    style: TextStyle(fontFamily: 'Baloo2', fontSize: 20),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width - 414) / 2,
              bottom: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Easy level
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => done_page()),
                      );
                    },
                    child: Container(
                      width: 416,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 146, 221, 149),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Easy',
                          style: TextStyle(
                              color: Color.fromARGB(223, 57, 134, 60),
                              fontFamily: 'Baloo',
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Medium level
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => done_page()),
                      );
                    },
                    child: Container(
                      width: 416,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 212, 204, 133),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Color.fromARGB(255, 185, 171, 44),
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Medium',
                          style: TextStyle(
                              color: Color.fromARGB(255, 149, 142, 69),
                              fontFamily: 'Baloo',
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Hard level
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => done_page()),
                      );
                    },
                    child: Container(
                      width: 416,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 219, 115, 108),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Hard',
                          style: TextStyle(
                              color: Color.fromARGB(255, 136, 35, 28),
                              fontFamily: 'Baloo',
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
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
                MaterialPageRoute(builder: (context) => const HomePage()),
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
}
