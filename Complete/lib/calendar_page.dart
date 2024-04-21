import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// void main() {
//   runApp(CalendarPage());
// }

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  EventList<Event> _eventList = EventList<Event>(events: {});

  Future<void> fetchEvents(DateTime date) async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/calendar/v3/calendars/primary/events'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // Parse the JSON response to extract event dates
      final events = jsonData['items'] as List;
      final Map<DateTime, List<Event>> eventsMap = {};
      for (var eventData in events) {
        final eventDate = DateTime.parse(eventData['start']['date']);
        final event = Event(date: eventDate);
        eventsMap[eventDate] = [event];
      }
      setState(() {
        _eventList = EventList<Event>(events: eventsMap);
      });
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
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
        body: CalendarCarousel<Event>(
          onDayPressed: (DateTime date, List<Event> events) {
            fetchEvents(date);
          },
          weekendTextStyle: TextStyle(color: Colors.red),
          thisMonthDayBorderColor: Colors.grey,
          customDayBuilder: (
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
            // Implement your custom day builder here if needed
            return null;
          },
          markedDatesMap: _eventList,
        ),
      ),
    );
  }
}
