import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/data.dart';
import 'package:whatsapp_clone/models/users.dart';

class StatusView extends StatefulWidget {
  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
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
        padding: EdgeInsets.only(top: 8),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            ListTile(
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/60438083?s=460&u=8b777d70ae095c37b2efc63a5977fbe7f314f053&v=4"),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 1.0,
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
              title: Text(
                "My Status",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("Tap to add status"),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 12,
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.grey[200],
              child: Text(
                "Viewed updates",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
              title: "Jack",
              subtitle: "Today, 12:44 am",
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              title: "Finn",
              subtitle: "Today, 01:50 pm",
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
              title: "Steve",
              subtitle: "Today, 12:20 pm",
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
              title: "Reed",
              subtitle: "Today, 09:40 am",
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/841135/pexels-photo-841135.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              title: "Ethan",
              subtitle: "Yesterday, 10:04 pm",
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/404190/pexels-photo-404190.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              title: "Sean",
              subtitle: "Today, 10:04 am",
            ),
            StatusWidget(
              imgUrl: "https://images.pexels.com/photos/1183992/pexels-photo-1183992.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              title: "Conner",
              subtitle: "Yesterday, 11:44 am",
            ),
            
           
          ],
        ));
  }
}

class StatusWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;
  const StatusWidget({
    Key key,
    this.imgUrl,
    this.subtitle,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Container(
              decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal, width: 2),
                    shape: BoxShape.circle),
                          child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.circle),
              ),
            ),
            backgroundColor: Colors.teal,
            backgroundImage: NetworkImage(
            imgUrl),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
        ),
                    Divider(
              indent: MediaQuery.of(context).size.width / 4.5,
              endIndent: 20,
              height: 0.5,
              thickness: 1,
            ),
      ],
    );
  }
}
