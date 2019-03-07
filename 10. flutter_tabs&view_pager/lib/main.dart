import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'tabs',
      home: ControllerWithTabs(),
    )
  );
}


class ControllerWithTabs extends StatefulWidget {
  @override
  createState() => ControllerWithTabsState();
}


class ControllerWithTabsState extends State<ControllerWithTabs> with SingleTickerProviderStateMixin {

  TabController _tabController;
  final List<Tab> tabs = <Tab> [
    Tab(text: 'Tabsgdfgdsgdfsg1',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',),
    Tab(text: 'Tab2sgdfgfdsgfdsgfd',)
  ];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab demo"),
        bottom: TabBar(tabs: tabs, controller: _tabController, isScrollable: true,),
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((Tab tab) {
            return Center(child: Text(tab.text),);
          }).toList(),
      ),
    );
  }
}