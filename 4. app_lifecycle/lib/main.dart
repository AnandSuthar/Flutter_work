import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'lifecycle',
      home: MyScreen()
    )
  );
}



class MyScreenState extends State<MyScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('2. initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('3. didChangeDependencies');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('9. Disposed (called when state object removed permanently )');
    super.dispose();
  }

  @override
  void didUpdateWidget(MyScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print('6. didUpdateWidget');

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (this.mounted) {
      print('4. mounted');
    }

    print('5. BuildContext');

    return Material(
      child: Center(
        child: FlatButton(
            onPressed: () {
              setState(() {
                print('~ set state');
              });
            }, child: Text('Ok')),
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
@override

  createState() {
    print('1. Create state');
    return MyScreenState();
  }

}