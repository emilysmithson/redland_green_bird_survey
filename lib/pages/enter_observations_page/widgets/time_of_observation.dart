import 'package:flutter/cupertino.dart';

class TimeOfObservation extends StatelessWidget {
  final DateTime? dateTime;
  final Function? onSelected;
  final DateTime? maxDate;

  const TimeOfObservation({
    super.key,
    this.dateTime,
    this.onSelected,
    this.maxDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoTheme(
        data: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(fontSize: 18),
          ),
        ),
        child: CupertinoDatePicker(
          minimumYear: 2020,
          initialDateTime: dateTime,
          minimumDate: DateTime(2021),
          maximumDate: maxDate,
          onDateTimeChanged: (DateTime newDateTime) {
            onSelected!(newDateTime);
          },
        ),
      ),
    );
  }
}
