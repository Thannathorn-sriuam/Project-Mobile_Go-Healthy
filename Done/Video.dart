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
            SizedBox(height: 50), // ระยะห่างระหว่าง Text ด้านบนกับ Text ด้านล่าง
            Text(
              'Squat',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // ระยะห่างระหว่าง Text ด้านบนกับ Text ด้านล่าง
            Text(
              'X 20',
              style: TextStyle(
                fontFamily: 'Baloo',
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100), // ระยะห่างระหว่าง Text ล่างกับสี่เหลี่ยม
            Center(
              child: InkWell(
                onTap: () {
                  // ทำงานเมื่อปุ่มถูกแตะ
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
                      'NEXT',
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
            SizedBox(height: 70), // ระยะห่างระหว่าง Text ล่างกับปุ่ม "Next"
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
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(_controller),
                VideoPlayerControls(controller: _controller),
              ],
            ),
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

class VideoPlayerControls extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerControls({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(16), // ปรับขอบของ Container
        color: Colors.black.withOpacity(0.03), // ทำให้พื้นหลังของเถบควบคุมมืดลง
        child: Column(
          children: [
            Slider(
              value: controller.value.position.inSeconds.toDouble(),
              min: 0,
              max: controller.value.duration?.inSeconds.toDouble() ?? 0,
              onChanged: (value) {
                final newPosition = Duration(seconds: value.toInt());
                controller.seekTo(newPosition);
              },
              onChangeEnd: (value) {
                final newPosition = Duration(seconds: value.toInt());
                controller.seekTo(newPosition);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    final newPosition = controller.value.position - Duration(seconds: 10);
                    controller.seekTo(newPosition);
                  },
                ),
                IconButton(
                  icon: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {
                    final newPosition = controller.value.position + Duration(seconds: 10);
                    controller.seekTo(newPosition);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}