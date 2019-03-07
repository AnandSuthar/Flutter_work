import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Sample(),
    )
  );
}











class Styles {

  static TextStyle style32(BuildContext context) {

    return TextStyle(
      inherit: true,
      fontSize: 11.0 * MediaQuery.of(context).size.width/320,
    );

  }

}


class Sample extends StatefulWidget {
  @override
  createState() => new SampleState();
}


class SampleState extends State<Sample> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    var queryData = MediaQuery.of(context);
    double devicePixelRatio = (queryData.size.width/320);


    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive layout design"),
      ),
      body: Container(

        color: Colors.black,
        child: AspectRatio(
          aspectRatio: 1/0.5,
          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[




              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Text("Blue", textAlign: TextAlign.center, style: Styles.style32(context),),
                ),
                flex: 7,
              ),

              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Text("Red", textAlign: TextAlign.center, style: Styles.style32(context),),
                ),
                flex: 3,
              ),





            ],
          ),
        ),


      ),

    );
  }

}