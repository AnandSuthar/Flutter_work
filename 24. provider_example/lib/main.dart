import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//https://www.youtube.com/watch?v=MkFjtCov62g


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(create: (_) => Counter(),
        child: Home(),
      ),
    );
  }
}





class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //final counter = Provider.of<Counter>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Consumer<Counter>(
          builder: (_, counter, __) => Text("Count = ${counter.getValue()}"),
        ),
      ),
      floatingActionButton: Consumer<Counter>(
        builder: (context, counter, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child: Text('+'),
                onPressed: () {
                  counter.increment();
                },
              ),
              FloatingActionButton(
                child: Text('-'),
                onPressed: () {
                  counter.decrement();
                },
              )
            ],
          );
        },
      ),
    );
  }
}









class Counter with ChangeNotifier {
  int _value = 0;
  increment() {
   _value++;
   notifyListeners();
  }
  decrement(){
    _value--;
    notifyListeners();
  }
  getValue() => _value;
}
