import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
            SizedBox(height: 40), // ระยะห่างระหว่างสี่เหลี่ยมกับ Text
            Container(
              width: double.infinity, // ให้ความกว้างเท่ากับขอบเขตของ Column
              height: 300, // ระบุความสูงเป็นค่าคงที่หรือตามที่คุณต้องการ
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: VideoPlayerWidget(),
            ),
            SizedBox(height: 10), // ระยะห่างระหว่าง Text ด้านบนกับ Text ด้านล่าง
            Text(
              'Squat',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5), // ระยะห่างระหว่าง Text ด้านบนกับ Text ด้านล่าง
            Text(
              'X 20',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // ระยะห่างระหว่าง Text ล่างกับสี่เหลี่ยม
            Center(
              child: InkWell(
                onTap: () {
                  // ทำงานเมื่อปุ่มถูกแตะ
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Start Watching',
                      style: TextStyle(
                        fontFamily: 'Baloo',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80), // ระยะห่างระหว่าง Text ล่างกับปุ่ม "Next"
            Text(
              'Press the next button to continue.',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: kBottomNavigationBarHeight), // เพิ่มระยะห่างสำหรับ bottomNavigationBar
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
                  // จัดการเหตุการณ์เมื่อกดปุ่ม Home
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/squat.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true); // ทำให้วิดีโอเล่นวนลูป
    _controller.play(); // เริ่มเล่นวิดีโอทันทีเมื่อโหลดเสร็จ
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
