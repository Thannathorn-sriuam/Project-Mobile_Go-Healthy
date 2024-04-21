import 'package:flutter/material.dart';
import 'package:go_healthy/Part.dart';
import 'package:go_healthy/Timer.dart';
import 'package:go_healthy/arm/medium/arm_medium1.dart';
import 'package:go_healthy/chest/easy/chest_easy1.dart';
import 'package:go_healthy/chest/hard/chest_hard1.dart';
import 'package:go_healthy/chest/medium/chest_medium1.dart';
import 'package:go_healthy/core/easy/core_easy1.dart';
import 'package:go_healthy/core/hard/core_hard1.dart';
import 'package:go_healthy/core/medium/core_medium1.dart';
import 'package:go_healthy/home_page.dart';
import 'package:go_healthy/leg/easy/Leg_easy1.dart';
import 'package:go_healthy/leg/hard/Leg_hard1.dart';
import 'package:go_healthy/leg/medium/Leg_medium1.dart';
import 'package:go_healthy/level_arm.dart';
import 'package:go_healthy/level_chest.dart';
import 'package:go_healthy/level_core.dart';
import 'package:go_healthy/level_leg.dart';
import 'package:go_healthy/login.dart';
import 'Done.dart';
import 'arm/easy/arm_easy1.dart';
import 'calendar_page.dart';
import 'calories.dart';
import 'info.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/info':
        return MaterialPageRoute(builder: (_) => info());
      case '/calories':
        return MaterialPageRoute(builder: (_) => CaloriesPage());
      case '/time':
        return MaterialPageRoute(builder: (_) => TimerPage());
      case '/calender':
        return MaterialPageRoute(builder: (_) => CalendarPage());
      case '/done':
        return MaterialPageRoute(builder: (_) => done_page());
      case '/part':
        return MaterialPageRoute(builder: (_) => Part());
      case '/la':
        return MaterialPageRoute(builder: (_) => level_arm());
      case '/lch':
        return MaterialPageRoute(builder: (_) => level_chest());
      case '/lco':
        return MaterialPageRoute(builder: (_) => level_core());
      case '/lleg':
        return MaterialPageRoute(builder: (_) => level_leg());
      case '/ae':
        return MaterialPageRoute(builder: (_) => arm_easy());
      case '/am':
        return MaterialPageRoute(builder: (_) => arm_medium());
      case '/ah':
        return MaterialPageRoute(builder: (_) => chest_easy());
      case '/che':
        return MaterialPageRoute(builder: (_) => chest_easy());
      case '/chme':
        return MaterialPageRoute(builder: (_) => chest_medium());
      case '/chh':
        return MaterialPageRoute(builder: (_) => chest_hard());
      case '/coe':
        return MaterialPageRoute(builder: (_) => core_easy());
      case '/come':
        return MaterialPageRoute(builder: (_) => core_medium());
      case '/coh':
        return MaterialPageRoute(builder: (_) => core_hard());
      case '/le':
        return MaterialPageRoute(builder: (_) => leg_easy());
      case '/lme':
        return MaterialPageRoute(builder: (_) => leg_medium());
      case '/lh':
        return MaterialPageRoute(builder: (_) => leg_hard());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
