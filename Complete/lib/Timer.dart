import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const TimerPage());
}

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Go Healthy",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Baloo',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TimerScreen(),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

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
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isRunning) {
        setState(() {
          _seconds++;
        });
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
              if (_controller.isCompleted) {
                  _controller.repeat();  // ถ้าแอนิเมชันเสร็จสมบูรณ์แล้ว ให้ทำซ้ำ
              } else {
                  _controller.forward();  // เริ่มแอนิเมชันต่อเนื่อง
              }
          } else {
              _controller.stop();  // หยุดแอนิเมชันเมื่อหยุด
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
                      style: const TextStyle(fontSize: 60, fontFamily: 'Baloo'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: Transform.rotate(
                    angle: _animation.value * 0.0174533,
                    child: const Icon(
                      Icons.hourglass_bottom,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _toggleTimer,
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  color: Colors.black,
                  iconSize: 48,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  color: Colors.black,
                  iconSize: 48,
                ),
              ],
            ),
          ],
        ),
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
    );
  }
}