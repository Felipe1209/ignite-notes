import 'package:flutter/material.dart';
import 'package:ignite_notes/create_note_page.dart';
import 'package:ignite_notes/home_page.dart';

void main(){
  runApp(MaterialApp(
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
  ));

}