import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home_page.dart';
import 'package:whatsapp_clone/screens/home_page_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsAppClone",
      theme: ThemeData(
        backgroundColor: Colors.teal,
      ),
      home: HomePage2(),
    );
  }
}