import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/note.dart';
import 'addnotescreen.dart';

class Homescreen extends StatefulWidget{
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen>{
  List<NoteModel> Notes = [];
  @override
  Widget build (BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed:()async{
            final note = await Navigator.push(
                context,
              MaterialPageRoute(builder: (context)=>AddNoteScreen()),
            );
            if(note != null){
              setState(() {
                Notes.add(note);
              });
            }
          },
          child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Container(
            height: 1000,
            color: Colors.deepPurple,
          ),
          const Positioned(
            top: 70,
            left: 20,
            child: Text("My notes",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 150 ,
            right: 15,
            left: 15,
            bottom: 0,
            child: ListView.builder(
              itemCount: Notes.length,
                itemBuilder:(context,index){
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(Notes[index].title),
                    subtitle: Text(Notes[index].descr),
                    trailing: IconButton(
                        onPressed: (){
                          setState(() {
                            Notes.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                    ),
                  ),
                );
                }
            ),
          )
        ],
      ),
    );
  }
}