import 'package:flutter/material.dart';
import 'package:hitask/widgets/colors.dart';

class CompletedTask extends StatefulWidget {
  static final String route = "completed_task";
  CompletedTask({Key? key}) : super(key: key);

  @override
  _CompletedTaskState createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          title: Text(
            "Completed Tasks",
            style: TextStyle(color: cBackgroundDeep_1, fontSize: 28),
          ),
        ),
        body: Center(
          child: Text("List of completed tasks"),
        ),
      ),
    );
  }
}
