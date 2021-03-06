import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hitask/Utils.dart';
import 'package:hitask/pages/task_expanded.dart';

class Tasks extends StatefulWidget {
  final String date = DateTime.now().toLocal().toString();

  Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<int> savedTasks = List<int>.generate(25, (int index) => index);

  void _goToExpandedTask() {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        reverseTransitionDuration: Duration(milliseconds: 500 ),
        pageBuilder: (context, animation, secAnimaition) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: Interval(0, 0.5));
          return FadeTransition(
              opacity: curvedAnimation, child: TaskExpanded());
        }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savedTasks.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey<int>(savedTasks[index]),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: ListTile(
              onTap: _goToExpandedTask,
              contentPadding: const EdgeInsets.all(8.0),
              title: Text('Task ${savedTasks[index]}'),
              trailing: Text('${widget.date}'),
            ),
          ),
          background: taskSwipeRightAction(),
          secondaryBackground: taskSwipeLeftAction(),
          onDismissed: (DismissDirection direction) =>
              dismissItem(context, index, direction),
        );
      },
    );
  }

  Widget taskSwipeRightAction() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.check_circle,
          size: 30,
          color: Colors.green,
        ),
      );

  Widget taskSwipeLeftAction() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete_forever,
          size: 30,
          color: Colors.red,
        ),
      );

  Widget? dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    setState(() {
      savedTasks.removeAt(index);
    });

    switch (direction) {
      case DismissDirection.endToStart:
        Utils.showSnackBar(context, "Task deleted");
        break;
      case DismissDirection.startToEnd:
        Utils.showSnackBar(context, "Task complete");
        break;
      case DismissDirection.vertical:
        break;
      case DismissDirection.horizontal:
        break;
      case DismissDirection.up:
        break;
      case DismissDirection.down:
        break;
      case DismissDirection.none:
        break;
    }
  }
}
