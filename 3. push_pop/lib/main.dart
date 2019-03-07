import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Push pop',
    home: FirstScreen(),
  ));
}


class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go to second screen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen())
            );
          },
        ),
      ),
    );
  }

}


class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('go to back'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go to back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}