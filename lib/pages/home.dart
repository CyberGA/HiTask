import 'package:flutter/material.dart';
import 'package:hitask/pages/completed_tasks.dart';
import 'package:hitask/widgets/add_task_btn.dart';
import 'package:hitask/widgets/colors.dart';
import 'package:hitask/widgets/tasks.dart';

class Home extends StatelessWidget {
  static final String route = "home";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    void _goToCompletedTasks() {
      Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1500),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.elasticInOut);
                return ScaleTransition(
                  alignment: Alignment(0, 0.9),
                  scale: animation,
                  child: child,
                );
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return CompletedTask();
              }));
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.white,
            width: _width,
            child: Column(
              children: [
                Container(
                  height: 60,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 45, right: 10),
                            child: Icon(
                              Icons.event_note,
                              color: cMain,
                              size: 28,
                            ),
                          ),
                          Text(
                            "My Tasks",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.normal,
                              color: cMain,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CircleAvatar(
                                backgroundColor: cBackground,
                                child: Icon(Icons.person)),
                          )
                          // Align(
                          //     alignment: Alignment.centerRight,
                          //     child: IconButton(
                          //       color: cMain,
                          //       padding: EdgeInsets.all(4),
                          //       alignment: Alignment.centerRight,
                          //       icon: Icon(Icons.post_add),
                          //       onPressed: () {},
                          //     ))
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  width: _width,
                  // padding: EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.only(bottom: 15),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      color: cBackground,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      // Expanded(child: Text("List view")),
                      Flexible(
                        flex: 14,
                        fit: FlexFit.tight,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [Tasks(), AddTask()],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: cBackgroundLight,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: InkWell(
                              onTap: _goToCompletedTasks,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.blue[900],
                                    size: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 2),
                                    child: Text(
                                      "Completed tasks",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: cBackgroundDeep_1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.launch,
                                    color: cBackgroundDeep_1,
                                    size: 18,
                                  ),
                                  Spacer(),
                                  Text(
                                    "30",
                                    style: TextStyle(color: cBackgroundDeep_1),
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
