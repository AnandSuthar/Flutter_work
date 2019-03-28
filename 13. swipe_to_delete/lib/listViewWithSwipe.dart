import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/46651974/swipe-list-item-for-more-options-flutter

class ListViewController extends StatefulWidget {
  @override
  createState() => ListViewControllerState();
}

class ListViewControllerState extends State<ListViewController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: ListTile.divideTiles(
              context: context,
              tiles: List.generate(42, (index) {
                return SlideMenu(
                  child: ListTile(
                    title: Container(
                      child: Text("Drag me"),
                    ),
                  ),
                  menuItems: <Widget>[
                    Container(
                      child: IconButton(
                          icon: Icon(Icons.delete), onPressed: () {}),
                    ),
                    Container(
                      child: IconButton(
                          icon: Icon(Icons.info), onPressed: () {}),
                    )
                  ],
                );
              }),
          ).toList(),
      ),
    );
  }


}

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  SlideMenu({this.child, this.menuItems});

  @override
  createState() => SlideMenuState();
}

class SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: Offset(0.0, 0.0), end: Offset(-0.2, 0.0))
        .animate(CurveTween(curve: Curves.decelerate).animate(_controller));

    return GestureDetector(

      onHorizontalDragUpdate: (data) {
        setState(() {
          _controller.value -= data.primaryDelta / context.size.width;
        });
      },

      onHorizontalDragEnd: (data) {
        if (_controller.value <= .35 || data.primaryVelocity > 2500) {
          _controller.value = 0;
        } else if (_controller.value >= .35 || data.primaryVelocity > -2500) {
          _controller.value = 500;
        }
      },

      child: Stack(
        children: <Widget>[
          SlideTransition(
            position: animation,
            child: widget.child,
          ),
          Positioned.fill(child: LayoutBuilder(builder: (context, constraint) {
            return Stack(
              children: <Widget>[
                Positioned(
                    right: .0,
                    top: .0,
                    bottom: .0,
                    width: constraint.maxWidth * animation.value.dx * -1,
                    child: Container(
                      color: Colors.black26,
                      child: Row(
                        children: widget.menuItems.map((child) {
                          return Expanded(child: child);
                        }).toList(),
                      ),
                    ))
              ],
            );
          }))
        ],
      ),


    );
  }
}
