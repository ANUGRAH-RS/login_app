import 'package:flutter/material.dart';
import 'package:login_app/Services/Firebasenoteservice.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  
      bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 247, 221, 230),
                    prefixIcon: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 8, 117, 219),
                    ),
                    hintText: "Title",
                    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 247, 221, 230),
                    prefixIcon: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 8, 117, 219),
                    ),
                    hintText: "Description",
                    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent, fixedSize: Size(400, 40)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await addnotes(title: titleController.text, description: descriptionController.text, context: context);
                  setState(() {
                    isLoading = false;
                  });
                  },
                child: isLoading?CircularProgressIndicator() :Text(
                  "Submit",
                  style: TextStyle(color: Colors.purple),
                ),
              
                  
             
              )
      ],),
      ));
  }
}
