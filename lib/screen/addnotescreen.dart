import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';

class AddNoteScreen extends StatefulWidget{
  const AddNoteScreen ({super.key});
  @override 
  State<AddNoteScreen> createState()=> _AddNoteScreenState();
}
class _AddNoteScreenState extends State<AddNoteScreen>{
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add note")),
      body: Padding(
          padding:const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descrController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "desc",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed:(){
                  NoteModel note = NoteModel(
                    title: titleController.text,
                    descr: descrController.text,
                  );
                  Navigator.pop(context,note);
                },
                child: const Text("save"),
            )
          ],
        ),
      ),
    );
  }
}