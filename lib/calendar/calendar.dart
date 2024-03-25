import 'package:enchanteddiary/add_entry/add_entry.dart';
import 'package:enchanteddiary/database/data_sources/colors_data_source.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Map<DateTime, Color> noteColors = {};

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    _updateNoteColors(DateTime(now.year, now.month, 1), DateTime(now.year, now.month + 1, 0));
  }

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);


  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TableCalendar(
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            if (noteColors.containsKey(date)) {
              return Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: noteColors[date] != Colors.white ? noteColors[date] : Color(0xFFf7d6bf),
                ),
                child: Center(child: Text('${date.day}')),
              );
            }
            return null;
          },
        ),

        onPageChanged: (focusedDay) {
          DateTime firstDayOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
          DateTime lastDayOfMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0);
          getNoteColorsForMonth(firstDayOfMonth, lastDayOfMonth).then((map) {
            setState(() {
              noteColors = map;
              _focusedDay = focusedDay;
            });
          });
        },
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
            color: Color(0xFFf7d6bf),
          ),
          holidayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFf7d6bf),
          ),
          weekendDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFf7d6bf),
          ),
          outsideDaysVisible: false,
        ),
        firstDay: DateTime.utc(2024, 03, 01),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (selectedDay != null && focusedDay != null) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddEntryWidget(dateToAddEntry: selectedDay),
              ),
            );
          }
        },

      ),
      Expanded(
        child: Container(),
      ),
    ]);
  }

  void _updateNoteColors(DateTime start, DateTime end) async {
    Map<DateTime, Color> newColors = await getNoteColorsForMonth(start, end);
    setState(() {
      noteColors = newColors;
    });
  }
}
