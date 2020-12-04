import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/call_view.dart';
import 'package:whatsapp_clone/screens/camera_view.dart';
import 'package:whatsapp_clone/screens/chat_view.dart';
import 'package:whatsapp_clone/screens/status_view.dart';
import 'package:whatsapp_clone/widgets/widget.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int indexTab = 1;

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

    double yourWidth = width / 5;

    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.teal,
                title: CustomAppbar(),
                floating: true,
                //pinned: true,
                bottom: TabBar(
                  isScrollable: true,
                  indicatorWeight: 3.5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: 30,
                          child: Icon(Icons.camera_alt)),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        width: yourWidth,
                        child: Text("CHATS"),
                      ),
                    ),
                    Tab(
                        child: Container(
                      alignment: Alignment.center,
                      width: yourWidth,
                      child: Text("STATUS"),
                    )),
                    Tab(
                        child: Container(
                      alignment: Alignment.center,
                      width: yourWidth,
                      child: Text("CALLS"),
                    )),
                  ],
                  controller: controller,
                  onTap: (index) {
                    setState(() {
                      indexTab = index;
                    });
                  },
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller,
            children: [
              CameraView(),
              ChatView(),
              StatusView(),
              CallView(),
            ],
          )),
      floatingActionButton: indexTab == 1
          ? FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.message),
              onPressed: () {},
            )
          : indexTab == 2
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(//color: Colors.black, 
                        shape: BoxShape.circle),
                        child: FloatingActionButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.teal,
                          child: Icon(
                            Icons.edit,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.photo_camera,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              : indexTab == 3
                  ? FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.call),
                      onPressed: () {},
                    )
                  : Container(),
    );
  }
}
