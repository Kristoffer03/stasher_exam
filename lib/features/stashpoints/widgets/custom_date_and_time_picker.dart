import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../view_model/stashpoint_view_model.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({super.key});

  static const route = "custom-date-picker";

  @override
  Widget build(BuildContext context) {
    StashpointViewModel stashpointViewModel =
        context.watch<StashpointViewModel>();
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Date: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            GestureDetector(
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                stashpointViewModel.setSelectedDate(date);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Center(
                    child: Text("Set Date",
                        style: TextStyle(color: Colors.white, fontSize: 16))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Time: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            GestureDetector(
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: DateTime.now().hour,
                        minute: DateTime.now().minute));

                stashpointViewModel.setSelectedTime(time);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Center(
                    child: Text("Set Time",
                        style: TextStyle(color: Colors.white, fontSize: 16))),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
                    child: Center(
                        child: Text("Cancel",
                            style:
                                TextStyle(color: Colors.lightBlue, fontSize: 16))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var dateTime = DateTime(
                        stashpointViewModel.selectedDate?.year ??
                            DateTime.now().year,
                        stashpointViewModel.selectedDate?.month ??
                            DateTime.now().month,
                        stashpointViewModel.selectedDate?.day ??
                            DateTime.now().day,
                        stashpointViewModel.selectedTime?.hour ??
                            DateTime.now().hour,
                        stashpointViewModel.selectedTime?.minute ??
                            DateTime.now().minute);
                    var dateFormatted = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime);
                    Navigator.pop(
                        context,
                        dateFormatted);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.lightBlue),
                    child: Center(
                        child: Text("Confirm",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
