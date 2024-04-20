import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

// void main() {
//   runApp(MyApp());
// }

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  int _seconds = 0;
  bool _isRunning = false;
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_isRunning) {
        setState(() {
          _seconds++;
        });
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _controller.forward(from: 0.0);
      } else {
        _controller.stop();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _seconds = 0;
      _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_seconds ~/ 60).toString().padLeft(2, "0");
    String seconds = (_seconds % 60).toString().padLeft(2, "0");

    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 5),
                  ),
                  child: Center(
                    child: Text(
                      '$minutes:$seconds',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: Transform.rotate(
                    angle: _animation.value * 0.0174533,
                    child: Icon(
                      Icons.hourglass_bottom,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _toggleTimer,
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  iconSize: 48,
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: _resetTimer,
                  icon: Icon(Icons.refresh),
                  iconSize: 48,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(),
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