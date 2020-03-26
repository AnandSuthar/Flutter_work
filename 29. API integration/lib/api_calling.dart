import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import 'network.dart';


class ApiCalling extends StatefulWidget {
  @override
  _ApiCallingState createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {

  bool showLoader = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    Network();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Stack(
          children: <Widget>[


            Center(
              child: RaisedButton(
                child: Text("Call API"),
                onPressed: () async {

                  setState(() => showLoader = true);

                  try {
                    User user = await UserExt.getUserInfo();
                    print(user.userId);
                    setState(() => showLoader = false);
                  } catch (error) {
                    setState(() => showLoader = false);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(error)));
                  }

                },
              ),
            ),
            Visibility(child: CircularProgressIndicator(backgroundColor: Colors.pink,), visible: showLoader,),


          ],
        ),
      ),
    );
  }
}
