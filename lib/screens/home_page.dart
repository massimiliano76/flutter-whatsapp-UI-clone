import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/call_view.dart';
import 'package:whatsapp_clone/screens/camera_view.dart';
import 'package:whatsapp_clone/screens/chat_view.dart';
import 'package:whatsapp_clone/screens/status_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
      length: 4,
      vsync: this,
    );

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width  / 5;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            title: Text("WhatsApp"),
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
            ),
            bottom: TabBar(            

              isScrollable: true,
            //  indicatorSize: TabBarIndicatorSize(),
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Container( alignment:Alignment.centerLeft, width: 30,child: Icon(Icons.camera_alt)),),
                Tab(child: Container(alignment: Alignment.center, width: yourWidth, child: Text("CHATS"),),),
                Tab(child: Container(alignment: Alignment.center, width: yourWidth, child: Text("STATUS"),)),
                Tab(child: Container(alignment: Alignment.center, width: yourWidth, child: Text("CALLS"),)),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            //fillOverscroll: true,
            child:TabBarView(
              //dragStartBehavior: DragStartBehavior.start,
              controller: controller,
              children: [
                CameraView(),
                ChatView(),
                StatusView(),
                CallView(),
              ],
            ),)
        ],
      ),
    );
  }
}
