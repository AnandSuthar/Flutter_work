import 'package:flutter/material.dart';
import 'package:form_validations/form_validations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
    );
  }
}








class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen>  {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "email",
                    labelText: "enter email"
                ),
                validator: Validate.email,
              ),

              RaisedButton(
                child: Text("Validate"),
                onPressed: () {
                  print("button pressed");
                  _formKey.currentState.validate();
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
