import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE NOTE"),
        centerTitle: true,
      ),

      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: _controller,
                maxLength: 500,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLines: 4,

              ),
              ElevatedButton(onPressed: (){}, child: Text("Salvar"))
            ],
          ),
        ),
      ),

    );
  }
}
