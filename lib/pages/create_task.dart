import 'package:flutter/material.dart';
import 'package:hitask/widgets/colors.dart';
import 'package:intl/intl.dart';

class CreateTask extends StatefulWidget {
  static final String route = "create_task";

  CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  String title = "";
  String note = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double gap = 20;

    // * selecting date and time
    String pickedDate = '${date.day}/${date.month}/${date.year}';
    final pickedTime = DateFormat.jm()
        .format(DateFormat("hh:mm:ss").parse("${time.hour}:${time.minute}:00"));

    // ? submit logic
    void _submitTask() {
      print(title);
      print(note);
      print(pickedTime);
      print(pickedDate);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              padding: const EdgeInsets.only(left: 20),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: cBackgroundDeep_1,
                size: 30,
              )),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Text(
              "Add Task",
              style: TextStyle(color: cBackgroundDeep_1, fontSize: 28),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
              width: size.width,
              height: size.height,
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                child: Column(
                  children: [
                    // *title
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: cBackgroundDeep_1)),
                          hintText: "Title",
                          labelText: "Title"),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: gap,
                    ),

                    // * note
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          note = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: cBackgroundDeep_1)),
                          hintText: "Add description about task",
                          labelText: "Add description about task"),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      minLines: 2,
                      maxLines: 8,
                    ),
                    SizedBox(
                      height: gap,
                    ),

                    // * date selection
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: cBackgroundDeep_1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(children: [
                        Text(pickedDate),
                        Spacer(),
                        IconButton(
                            onPressed: _getCustomDate,
                            icon: Icon(Icons.date_range))
                      ]),
                    ),
                    SizedBox(
                      height: gap,
                    ),

                    // * time selection
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: cBackgroundDeep_1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(children: [
                        Text(pickedTime),
                        Spacer(),
                        IconButton(
                            onPressed: _getCustomTime,
                            icon: Icon(Icons.schedule))
                      ]),
                    ),
                    SizedBox(
                      height: 26,
                    ),

                    // * submit button
                    ElevatedButton(
                        onPressed: _submitTask,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                        child: SizedBox(
                            width: size.width,
                            child: Text(
                              "ADD",
                              textAlign: TextAlign.center,
                            )))
                  ],
                ),
              )),
        ),
      ),
    );
  }

  // ? date selection logic
  void _getCustomDate() async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));

    if (newDate != null) {
      setState(() {
        date = newDate;
      });
    }
  }

  // ? time selection logic
  void _getCustomTime() async {
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: time);
    if (newTime != null) {
      setState(() {
        time = newTime;
      });
    }
  }
}
