// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Timer());
// }

// class Timer extends StatelessWidget {
//   const Timer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Go Healthy",
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'Baloo',
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.black,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.white,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(
//                 Icons.account_circle_outlined,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: () {
//                 // Add onPressed functionality here if needed
//               },
//             ),
//           ],
//         ),
//         body: MyApp(),
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: (
//           Text('Timer')
//         )
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  int _duration = 60; // 60 seconds
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _duration.toString(),
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isRunning)
                  ElevatedButton(
                    onPressed: _stopTimer,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                    child: Icon(
                      Icons.stop,
                      size: 32,
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: _startTimer,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      size: 32,
                    ),
                  ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(
                    Icons.refresh,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration > 0) {
          _duration--;
        } else {
          _timer.cancel();
          // Handle timer expiration
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Time\'s up!'),
                content: Text('The timer has expired.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          _isRunning = false;
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _duration = 60;
      _isRunning = false;
    });
  }
}