import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 63, 224, 71),
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/new-year-background-736885_1280.jpg'),
              ),
               Text(FirebaseAuth.instance.currentUser?.email??"Anugrah",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              const Text("FLUTTER DEVELOPPER",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              const Divider(
                color: Colors.tealAccent,
                indent: 150,
                endIndent: 150,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  child: Row(children: [
                    Icon(
                      Icons.phone,
                      color: const Color.fromARGB(255, 8, 117, 219),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text("21124564564",style: TextStyle(fontSize: 20),)
                  ])),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  child: Row(children: [
                    Icon(
                      Icons.email,
                      color: const Color.fromARGB(255, 12, 165, 38),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text("anugrah123@gmail.com",style: TextStyle(fontSize: 20),)
                  ])),
            ],
          ),
        ));
  }
}