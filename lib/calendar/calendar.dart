import 'package:enchanteddiary/add_entry/add_entry.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:enchanteddiary/footer.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Color selectedColor = Colors.transparent;

  void updateSelectorColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
            titleCentered: true,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 25,
            )),
        availableCalendarFormats: const {CalendarFormat.month: 'month'},
        calendarStyle: const CalendarStyle(
          defaultDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          holidayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          weekendDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          outsideDaysVisible: false,
        ),
        firstDay: DateTime.utc(2024, 03, 13),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (selectedDay != null && focusedDay != null) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            BoxDecoration(
              color: selectedColor,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddEntryWidget(dateToAddEntry: selectedDay),
              ),
            );
          }
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
      ),
      Expanded(
        child: Container(),
      ),
    ]);
  }
}
