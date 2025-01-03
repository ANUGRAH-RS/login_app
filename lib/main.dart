import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Login.dart';
import 'package:login_app/notescreen.dart';
import 'package:login_app/addnotes.dart';
import 'package:login_app/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(MaterialApp(home: Login(),));
  
}

