import 'package:flutter/material.dart';
import 'package:ignite_notes/widgets/save_button_widget.dart';
import 'package:ignite_notes/widgets/text_field_widget.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  TextEditingController _controller = TextEditingController();
  String note = '';
  String title = 'CREATE NOTE';

  _save(){
    if(_controller.text.isNotEmpty){
      note = _controller.text;
      Navigator.pop(context, note);
    }else{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('A nota não pode estar vazia!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK')
            )
          ],
        );
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if(ModalRoute.of(context)!.settings.arguments != null){
        note = ModalRoute.of(context)!.settings.arguments as String;
        _controller.text = note;
        setState(() {
          title = 'EDIT NOTE';
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          if(title == "EDIT NOTE")
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                Navigator.pop(context, '');
              },
            )
        ],
      ),

      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldWidget(controller: _controller),
              Row(
                children: [ SaveButtonWidget(onPressed: _save) ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
