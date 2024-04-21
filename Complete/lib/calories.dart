import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class CaloriesPage extends StatefulWidget {
  @override
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  int calories = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                DateFormat('d MMMM yyyy').format(DateTime.now()),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 60),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 234,
                  height: 234,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 5),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$calories',
                      style: TextStyle(
                        fontSize: 64,
                        color: Colors.black,
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Calories',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/burn.png',
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Total Calories Burned',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Today',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
              ),
            ),
            // test buttom to add calories
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       calories += 100;
            //       _saveCalories(calories);
            //     });
            //   },
            //   child: Text('Add 100 Calories'),
            // ),
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

  @override
  void initState() {
    super.initState();
    _resetCaloriesAt4AM();
    _loadCalories();
  }

  

  void _loadCalories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      calories = prefs.getInt('calories') ?? 0;
    });
  }

  void _saveCalories(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('calories', value);
  }

  void _resetCaloriesAt4AM() async {
    var timeToReset = TimeOfDay(hour: 4, minute: 0);
    var now = TimeOfDay.now();

    var resetTime;
    if (now.hour > 4 || (now.hour == 4 && now.minute > 0)) {
      resetTime = DateTime.now().add(Duration(days: 1));
    } else {
      resetTime = DateTime.now();
    }
    resetTime = DateTime(resetTime.year, resetTime.month, resetTime.day,
        timeToReset.hour, timeToReset.minute);

    var timeUntilReset = resetTime.difference(DateTime.now());

    Future.delayed(timeUntilReset, () {
      setState(() {
        calories = 0;
        _saveCalories(calories);
      });
      _resetCaloriesAt4AM();
    });
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calories App',
    home: CaloriesPage(),
  ));
}
