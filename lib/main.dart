import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitask/pages/completed_tasks.dart';
import 'package:hitask/pages/create_task.dart';
import 'package:hitask/pages/home.dart';
import 'package:hitask/widgets/add_task_btn.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiTask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue[80],
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)),
      initialRoute: Home.route,
      routes: {
        Home.route: (BuildContext context) => Home(),
        CreateTask.route: (BuildContext context) => CreateTask(),
        CompletedTask.route: (BuildContext context) => CompletedTask()
      },
    );
  }
}
