import 'package:flutter/material.dart';

import 'profilepage.dart';
import 'chatpage.dart';
import 'videofeed.dart';
import 'news.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new Material(
        color: Colors.transparent,
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.announcement), text: ('To-Do'),),
            new Tab(icon: Icon(Icons.video_library), text: ('Feeds'),),
            new Tab(icon: Icon(Icons.chat), text: ('Doctors'),),
            new Tab(icon: Icon(Icons.person), text: ('Profile'),),
          ],
        ),
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          NewsPage(),
          NewsFeed(),
          ChatPage(),
          ProfilePage(),
        ],
      ),
        );
  }
}