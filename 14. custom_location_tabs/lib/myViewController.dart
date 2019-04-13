import 'package:flutter/material.dart';


class MyViewController extends StatefulWidget {

  @override
  createState() => MyViewControllerState();

}


class MyViewControllerState extends State<MyViewController> with SingleTickerProviderStateMixin {

  TabController _tabController;

  final List<Tab> tabs = <Tab> [
    Tab(text: 'Now Playing',),
    Tab(text: 'Trendings',),
    Tab(text: 'Upcoming',),
    Tab(text: 'Popular',),
    Tab(text: 'Top Rated',),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("App bar"),
      ),


      body: Column(
        children: <Widget>[
          TabBar(tabs: tabs, controller: _tabController, isScrollable: true, labelColor: Colors.red, indicatorColor: Colors.red,),
          Container(
            height: 200,
          ),
          Container(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.purple,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.orange,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ]
            )
          )
        ],
      )




    );
  }
}