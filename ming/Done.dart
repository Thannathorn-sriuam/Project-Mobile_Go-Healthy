import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const done_page());
}

class done_page extends StatelessWidget {
  const done_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'GO HEALTHY',
            style: TextStyle(
              fontFamily: 'Baloo',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'All Done',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 30,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You have complete',
              style: TextStyle(
                fontFamily: 'Baloo2',
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            // const SizedBox(height: 10),
            const Text(
              'all exercise',
              style: TextStyle(
                fontFamily: 'Baloo2',
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 60),
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
                  'assets/correct.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 60),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
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
            const SizedBox(height: 20),
            // const Text(
            //   'Press the back button to watch result.',
            //   style: TextStyle(
            //     fontFamily: 'Baloo',
            //     color: Colors.black,
            //     fontSize: 18,
            //   ),
            // ),
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
}
