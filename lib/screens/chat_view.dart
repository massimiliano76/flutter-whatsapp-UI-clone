import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone/data/data.dart';
import 'package:whatsapp_clone/models/users.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  
  List<UserModel> usersList = new List();
 
  @override
  void initState() { 
    super.initState();
    usersList = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
          child:          
        ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // physics: ClampingScrollPhysics(),
                physics: NeverScrollableScrollPhysics(
                  parent: ScrollPhysics()
                ),
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
          
          ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(usersList[index].imgUrl),),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(usersList[index].userName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
              Text(usersList[index].time, style: TextStyle(fontSize: 14,),),
            ],
            
          ),
          subtitle: Text("Available"),
          ),
          Divider(
          indent: MediaQuery.of(context).size.width/4.5,
          endIndent: 15,
          height: 0.5,
          thickness: 1,
          ),
                    ],
                  );
                },
                ),
        ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String imgUrl;
  final String userName;
  UserTile({this.userName, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(        
          children: [
          Container(
            padding: EdgeInsets.only(right: 12),
            //height: 200,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imgUrl),)),
          Container(      
            
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    
                  ],
                ),
                SizedBox(height: 5,),
                Text("Available", style: TextStyle(color: Colors.grey[700], fontSize: 17), textAlign: TextAlign.start,),
                //SizedBox(height: 10,), 
                               
              ],
            ),
          )
        ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Divider(
            indent:57,
            thickness: 0.19,
            color: Colors.brown,
          ),
        )
      ],
          ),
        );
  }
}

