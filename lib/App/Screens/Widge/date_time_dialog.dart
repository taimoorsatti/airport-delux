import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Helpers/ImportFile.dart';
import '../../Helpers/common/my_colors.dart';
import '../where_to/where_to_viewmodel.dart';
import 'date_selection_container.dart';
import 'flat_Button_Widget.dart';

class DateTimeDialog extends StatefulWidget {
  final String titleText;
  WhereToViewModel viewmodel;
  String onClick;

  DateTimeDialog(
      {Key key, @required this.titleText, this.viewmodel, this.onClick})
      : super(key: key);

  @override
  State<DateTimeDialog> createState() => _DateTimeDialogState();
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: 350,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Schedule a Ride",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 20,
                      letterSpacing: 0.47,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 21,
              ),
              DateSelectionContainer(
                myText:
                    "${widget.viewmodel.myWeekDays[widget.viewmodel.selectedDate.weekday - 1]}, ${widget.viewmodel.selectedDate.day.toString().padLeft(2, '0')} ${widget.viewmodel.myMonths[widget.viewmodel.selectedDate.month - 1]}",
                myOnTap: () async {
                  final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 0)),
                      lastDate: DateTime(2101));
                  if (picked != null && picked != widget.viewmodel.selectedDate)
                    setState(
                      () {
                        widget.viewmodel.selectedDate = picked;
                      },
                    );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              DateSelectionContainer(
                myText:
                    "${widget.viewmodel.selectedTime.hourOfPeriod} : ${widget.viewmodel.selectedTime.minute} ${widget.viewmodel.selectedTime == DayPeriod.am ? 'AM' : 'PM'}",
                myOnTap: () async {
                  final TimeOfDay picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute,
                    ),
                  );
                  if (picked != null &&
                      picked != widget.viewmodel.selectedTime) {
                    setState(() {
                      widget.viewmodel.selectedTime = picked;
                    });
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              FlatButtonWidget(
                btnTxt: "Set Pickup Time",
                btnColor: kAccentColor,
                btnOnTap: () {
                  setState(() {
                    TimeOfDay currenttime = TimeOfDay(
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute,
                    );
                    DateTime currentDate = DateTime.now();

                    if (widget.viewmodel.selectedTime.hour <=
                            currenttime.hour &&
                        currenttime.minute <= widget.viewmodel.selectedTime.minute
                           &&
                        widget.viewmodel.selectedDate.month <=
                            currentDate.month &&
                        widget.viewmodel.selectedDate.day <= currentDate.day) {
                      Get.snackbar("error :", "invalid date and time",
                          backgroundColor: Colors.black,
                          colorText: Colors.white);
                    } else {
                      widget.onClick == "pick"
                          ? widget.viewmodel.setDatePick =
                              "${widget.viewmodel.myWeekDays[widget.viewmodel.selectedDate.weekday - 1]}, ${widget.viewmodel.selectedDate.day.toString().padLeft(2, '0')} ${widget.viewmodel.myMonths[widget.viewmodel.selectedDate.month - 1]}" +
                                  "," +
                                  "${widget.viewmodel.selectedTime.hourOfPeriod} : ${widget.viewmodel.selectedTime.minute} ${widget.viewmodel.selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}"
                          : widget.viewmodel.setDateReturn =
                              "${widget.viewmodel.myWeekDays[widget.viewmodel.selectedDate.weekday - 1]}, ${widget.viewmodel.selectedDate.day.toString().padLeft(2, '0')} ${widget.viewmodel.myMonths[widget.viewmodel.selectedDate.month - 1]}" +
                                  "," +
                                  "${widget.viewmodel.selectedTime.hourOfPeriod} : ${widget.viewmodel.selectedTime.minute} ${widget.viewmodel.selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}";
                      if (widget.onClick == "pick") {
                        widget.viewmodel.pickDate =
                        "${widget.viewmodel.myWeekDays[widget.viewmodel.selectedDate.weekday - 1]}, ${widget.viewmodel.selectedDate.day.toString().padLeft(2, '0')} ${widget.viewmodel.myMonths[widget.viewmodel.selectedDate.month - 1]}";
                        widget.viewmodel.pickTime =
                            "${widget.viewmodel.selectedTimeReturn.hour}:${widget.viewmodel.selectedDate.minute}:${widget.viewmodel.selectedDate.second}";

                      }else{
                        widget.viewmodel.returnDate =
                        "${widget.viewmodel.myWeekDays[widget.viewmodel.selectedDate.weekday - 1]}, ${widget.viewmodel.selectedDate.day.toString().padLeft(2, '0')} ${widget.viewmodel.myMonths[widget.viewmodel.selectedDate.month - 1]}";
                        widget.viewmodel.returnTime =
                        "${widget.viewmodel.selectedTimeReturn.hour}:${widget.viewmodel.selectedDate.minute}:${widget.viewmodel.selectedDate.second}";
                      }
                      Navigator.of(context).pop();
                    }
                  });
                },
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
