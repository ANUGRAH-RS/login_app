import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> addnotes({required String title,required String description,required BuildContext context})async {
  try{
    FirebaseFirestore.instance.collection('notes').add({'title':title,'description':description,'userid':FirebaseAuth.instance.currentUser?.uid,});

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note Added Successfully")));

    

  }
  catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));


  }
}