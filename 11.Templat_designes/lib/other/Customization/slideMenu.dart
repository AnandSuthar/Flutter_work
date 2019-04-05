import 'package:flutter/material.dart';
import 'package:template_design/other/utils.dart';



class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;
  final double menuWidth;
  final int index;
  bool needToHideMenu = false;
  final ValueChanged<int> onItemSelected;
  final ValueChanged<int> onItemDrage;
  final ValueChanged<int> onItemTap;

  SlideMenu({
    this.child,
    this.menuItems,
    this.menuWidth,
    this.index,
    this.needToHideMenu,
    this.onItemSelected,
    this.onItemDrage,
    this.onItemTap
  });

  @override
  createState() => SlideMenuState();
}


class SlideMenuState extends State<SlideMenu> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: Offset(0.0, 0.0), end: Offset(Utils.isPhone() ? -0.45 : -0.25 , 0.0))
        .animate(CurveTween(curve: Curves.decelerate).animate(_controller));

    if (widget.needToHideMenu) {
      _controller.value = 0;
    }


    return GestureDetector(

      onTap: () {
        widget.onItemTap(widget.index);
      },
      onHorizontalDragStart: (data) {
        widget.onItemDrage(widget.index);
      },

      onHorizontalDragUpdate: (data) {
        setState(() {
          _controller.value -= data.primaryDelta / context.size.width;
        });
      },

      onHorizontalDragEnd: (data) {
        if (_controller.value <= .35 || data.primaryVelocity > 2500) {
          _controller.value = 0;
          widget.onItemDrage(null);
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