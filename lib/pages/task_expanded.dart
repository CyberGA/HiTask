import 'package:flutter/material.dart';
import 'package:hitask/widgets/colors.dart';

class TaskExpanded extends StatelessWidget {
  const TaskExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: cBackground,
              width: 1.5,
            )
          ),
          child: Center(
            child: Text("Task Expanded"),
          ),
        ),
      ),
    );
  }
}