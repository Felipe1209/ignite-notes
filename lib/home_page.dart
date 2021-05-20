import 'package:flutter/material.dart';

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
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                  onTap: () async{
                    var note = await Navigator.pushNamed(context, '/create', arguments: notes[i]);
                    if (note != ''){
                      if(note != null){
                        notes[i] = note as String;
                      }
                    } else {
                      notes.removeAt(i);
                    }
                    setState((){});
                  },
              ))
            ],
      ))),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          var note = await Navigator.pushNamed(context, '/create');
          if (note != null)
          setState(() {
            notes.add(note as String);
          });
        }
      ),
    );
  }
}
