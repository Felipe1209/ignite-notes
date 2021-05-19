import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    //espera o primeiro frame para executar as ações
    //usa-se pois no initState ainda não existe context até o primeiro frame
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
                Navigator.pop(context, null);
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
              TextField(
                controller: _controller,
                maxLength: 500,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLines: 8,
                autofocus: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), //arredonda a borda
                    )
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16)
                        ),
                        child: Text("SAVE", style: TextStyle(fontSize: 16),),
                        onPressed: _save
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
