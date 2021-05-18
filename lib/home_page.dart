import 'package:flutter/material.dart';
import 'package:ignite_notes/create_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              for (int i = 0; i < notes.length; i++)
              Card(child: ListTile(title: Text(notes[i]),))
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateNotePage()));
          });
        },
      ),



    );
  }
}
