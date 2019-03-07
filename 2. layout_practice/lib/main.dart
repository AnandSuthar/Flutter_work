import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'layout practice',
      home: FirstScreen(),
    )
  );
}



class FirstScreen extends StatelessWidget {


  Widget titleCell = Container(

    margin: EdgeInsets.all(32.0),
    child: Row(
      children: <Widget>[


        Expanded(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Anand Suthar', style: TextStyle(fontWeight: FontWeight.bold,),),
            ),
            Text('Address as subtitle', style: TextStyle(color: Colors.grey),)
          ],
        ),
        ),


        Icon(
          Icons.star,
          color: Colors.red,
        ),

        Text('547')

      ],
    ),

  );


  Widget _buttonSection(Color color) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'Call'),
          _buildButtonColumn(color, Icons.near_me, 'Route'),
          _buildButtonColumn(color, Icons.share, 'Share'),
        ],
      ),
    );
  }

  
  Widget textSection = Container(
    padding: EdgeInsets.all(32.0),
    child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.', softWrap: true,),
  );

  Widget imageBanner = Container(
    child: Column(
      children: <Widget>[
        Image.asset('images/chatnew.jpg', width: 600, height: 240, fit: BoxFit.cover,),
      ],
    ),
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(label, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: color),),
        )
      ],
    );
  }






  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('layout design'),
      ),
      body: ListView(
        children: <Widget>[
          imageBanner,
          titleCell,
          _buttonSection(color),
          textSection,
        ],
      ),

    );
  }
}