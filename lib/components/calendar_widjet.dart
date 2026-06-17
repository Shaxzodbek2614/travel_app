import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // Tanlangan kunlar oralig'i
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime(2023, 6, 1);

  // Mavjud bo'lmagan kunlar
  final List<DateTime> _unavailableDays = [
    DateTime(2023, 6, 21),
  ];

  bool _isUnavailable(DateTime day) {
    return _unavailableDays.any((d) =>
    d.year == day.year &&
        d.month == day.month &&
        d.day == day.day);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime(2023, 1, 1),
        lastDay: DateTime(2024, 12, 31),
        focusedDay: _focusedDay,

        // Range selection rejimi
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        rangeSelectionMode: RangeSelectionMode.enforced,

        onRangeSelected: (start, end, focused) {
          setState(() {
            _rangeStart = start;
            _rangeEnd = end;
            _focusedDay = focused;
          });
        },

        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

        // Mavjud bo'lmagan kunlar uchun marker
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            if (_isUnavailable(day)) {
              return Positioned(
                bottom: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Colors.red.shade200, width: 0.5),
                  ),
                  // child: Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Icon(Icons.circle,
                  //         size: 6, color: Colors.red.shade400),
                  //     const SizedBox(width: 3),
                  //     Text(
                  //       'Not Available',
                  //       style: TextStyle(
                  //         fontSize: 9,
                  //         color: Colors.red.shade700,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              );
            }
            return null;
          },
        ),

        calendarStyle: CalendarStyle(
          // Tanlangan range uslubi
          rangeStartDecoration: const BoxDecoration(
            color: Color(0xFF2196F3),
            shape: BoxShape.circle,
          ),
          rangeEndDecoration: const BoxDecoration(
            color: Color(0xFF2196F3),
            shape: BoxShape.circle,
          ),
          withinRangeDecoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.rectangle,
          ),
          withinRangeTextStyle: const TextStyle(
            color: Color(0xFF2196F3),
          ),
          rangeHighlightColor: Colors.blue.shade50,
          todayDecoration: const BoxDecoration(
            color: Color(0xFF2196F3),
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
        ),

        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: false,
          leftChevronIcon: Icon(Icons.chevron_left, size: 20),
          rightChevronIcon: Icon(Icons.chevron_right, size: 20),
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          weekendStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}