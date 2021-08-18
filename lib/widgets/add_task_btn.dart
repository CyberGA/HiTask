
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hitask/pages/create_task.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _createTask() {
      Navigator.of(context).pushNamed(CreateTask.route, arguments: {
      });
    }

    return Positioned(
        bottom: 4,
        right: 10,
        child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 70,
          onPressed: _createTask,
          icon: Stack(alignment: Alignment.center, children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            Icon(
              Icons.add_circle,
              color: Colors.blueAccent[200],
            ),
          ]),
        ));
  }
}
