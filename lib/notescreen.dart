

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/addnotes.dart';

class Notescreen extends StatefulWidget {
  const Notescreen({super.key});

  @override
  State<Notescreen> createState() => _NotescreenState();
}

class _NotescreenState extends State<Notescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection('notes').where('userid',isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){
          return Center(child: Text('Something went wrong'),);
        }
        else{
          var data=snapshot.data!.docs;
          print(data.length);
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var note = data[index].data();
              return Card(child: ListTile(
                trailing: IconButton(onPressed: () {
                  FirebaseFirestore.instance.collection('notes').doc(data[index].id).delete();
                }, icon: Icon(Icons.delete,color: Colors.red,)),
                
                title: Text(note['title']),
                subtitle: Text(note["description"]),
              ),
      );
            },);
        }
      },),
      floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (_) => Note()));

      
    },
    child: Icon(Icons.add),),);
  }
}