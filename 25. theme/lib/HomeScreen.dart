import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Text('item 1'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
      ),
      appBar: AppBar(
        title: Text("App bar"),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Text('Display 4', style: Theme.of(context).textTheme.display4,),
          ),
          InkWell(
            onTap: () {},
            child: Text('Display 3', style: Theme.of(context).textTheme.display3,),
          ),
          InkWell(
            onTap: () {},
            child: Text('Display 2', style: Theme.of(context).textTheme.display2,),
          ),
          InkWell(
            onTap: () {},
            child: Text('Display 1', style: Theme.of(context).textTheme.display1,),
          ),
          InkWell(
            onTap: () {},
            child: Text('headline', style: Theme.of(context).textTheme.headline,),
          ),
          InkWell(
            onTap: () {},
            child: Text('title', style: Theme.of(context).textTheme.title,),
          ),
          InkWell(
            onTap: () {},
            child: Text('subhead', style: Theme.of(context).textTheme.subhead,),
          ),
          InkWell(
            onTap: () {},
            child: Text('body2', style: Theme.of(context).textTheme.body2,),
          ),
          InkWell(
            onTap: () {},
            child: Text('body1', style: Theme.of(context).textTheme.body1,),
          ),
          InkWell(
            onTap: () {},
            child: Text('caption', style: Theme.of(context).textTheme.caption,),
          ),
          InkWell(
            onTap: () {},
            child: Text('button', style: Theme.of(context).textTheme.button,),
          ),
          InkWell(
            onTap: () {},
            child: Text('subtitle', style: Theme.of(context).textTheme.subtitle,),
          ),
          InkWell(
            onTap: () {print('apple');},
            child: Text('overline', style: Theme.of(context).textTheme.overline,),
          ),
//          InkWell(
//            child: Center(child: CircularProgressIndicator()),
//          ),
//          TextFormField(
//            decoration: InputDecoration(
//              labelText: "Label",
//              hintText: "Hint",
//              helperText: "Helper text",
//              counterText: "Counter text",
//              errorText: "Error text",
//              //suffixText: '$'
//            ),
//          )














        ],
      ),
//      body:SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            Text('Display 4', style: Theme.of(context).textTheme.display4,),
//          ],
//        ),
//      )
    );

  }
}


