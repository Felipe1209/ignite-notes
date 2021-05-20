import 'package:flutter/material.dart';
import 'create_note_page.dart';
import 'home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      initialRoute: '/home',
      routes: {
        '/home' : (context) => HomePage(),
        '/create' : (context) => CreateNotePage()
      },
    );
  }
}
