import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new TableApp());

class TableApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'app title',
      home: Scaffold(
        appBar: AppBar(
          title: Text('bar title'),
        ),
        body: Center(
          child: TableWidget(),
        ),
      ),
    );
  }

}




class TableWidgetState extends State<TableWidget> {

  var _members = [];

  _loadData() async {
    String api = 'https://api.github.com/orgs/raywenderlich/members';
    http.Response response = await http.get(api);
    _members = jsonDecode(response.body);

    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget _buildRowItem(int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      splashColor: Colors.red,
      onTap: () {
        print('tapped at ${index}');
      },
      child: Container(
        padding: EdgeInsets.all(18.0),
        child: Text('${_members[index]['login']}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: _members.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRowItem(index);
      },
    );
  }
}

class TableWidget extends StatefulWidget {
  @override
  createState() => TableWidgetState();
}