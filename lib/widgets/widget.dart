import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("WhatsApp"),
        Row(children: [Icon(Icons.search, ), Icon(Icons.more_vert),
      ],
    ),
      ]);
  }
}

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Icon(Icons.more_vert),
      
      onChanged: (val){
        setState(() {
          selectedValue = val;
        });
      },
      isDense: true,
      isExpanded: false,
      items: [
        DropdownMenuItem(
          child:Text("New Group"),
          value: 1,
        ),
        
        DropdownMenuItem(
          child:Text("New Group"),
          value: 2,
        ),
        DropdownMenuItem(
          child:Text("New Group"), value: 3,
        ),
        DropdownMenuItem(
          child:Text("New Group"), value: 4,
        )
      ],
    );
  }
}