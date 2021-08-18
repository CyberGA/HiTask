import 'package:flutter/material.dart';
import 'package:hitask/widgets/colors.dart';

class CreateTask extends StatefulWidget {
  static final String route = "create_task";

  CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Add Task",
              style: TextStyle(color: cBackgroundDeep_1, fontSize: 28),
            ),
          ),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            
            child: Text("add task")),
      ),
    );
  }
}
