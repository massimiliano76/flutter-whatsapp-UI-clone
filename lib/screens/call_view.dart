import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/data.dart';
import 'package:whatsapp_clone/models/users.dart';

class CallView extends StatefulWidget {
  @override
  _CallViewState createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  List<UserModel> usersList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersList = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(usersList[index].imgUrl),
                  radius: 30,
                ),
                title: Text(
                  usersList[index].userName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(usersList[index].time),
                trailing: Icon(Icons.phone),
              ),
              Divider(
                indent: MediaQuery.of(context).size.width / 4.5,
                endIndent: 15,
                height: 0.5,
                thickness: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
