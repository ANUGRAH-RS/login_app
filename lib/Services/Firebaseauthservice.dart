// ignore: file_names, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_app/Profile.dart';
import 'package:login_app/bottomnavigation.dart';


Future<void> signup({required String email,required String password,required String username,required String confirmpassword,required BuildContext context})async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Successfull")));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnavigation()));
  }
  catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

  }



}


Future<void> login({required String email,required String password,required BuildContext context})async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Successfull")));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnavigation()));
  }
  catch(e){
    print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

  }



}



