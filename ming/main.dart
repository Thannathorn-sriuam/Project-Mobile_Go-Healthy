import 'package:flutter/material.dart';
import 'package:go_healthy/History.dart';
import 'package:go_healthy/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    History(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.black,
          child: InkWell(
            onTap: () {
              _onItemTapped(0); // Navigate to home page when the icon is clicked
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
