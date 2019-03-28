//https://medium.com/coding-with-flutter/flutter-bottomappbar-navigation-with-fab-8b962bb55013


import 'package:flutter/material.dart';

class BottombarItem {
  IconData iconData;
  String title;

  BottombarItem({this.iconData, this.title = ""});
}



class Bottombar extends StatefulWidget {

  final List<BottombarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  createState() => BottombarState();

  Bottombar({
    this.items,
    this.centerItemText,
    this.height,
    this.iconSize,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  });

}

class BottombarState extends State<Bottombar> {

  int _selectedIndex = 0;

  _updateIndex(int index) {
//    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }



  Widget _buildTabItem({BottombarItem item, int index, ValueChanged<int> onPressed}) {

    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
        child: SizedBox(
            height: widget.height,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => onPressed(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(item.iconData, color: color, size: widget.iconSize,),
                    //Text(item.title, style: TextStyle(color: color),)
                  ],
                ),
              ),
            )
        )
    );

  }

  Widget _buildMiddleTabItem() {
    return Expanded(
        child: SizedBox(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: widget.iconSize,),
              Text(
                widget.centerItemText ?? '',
                style: TextStyle(color: widget.color),
              )
            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {

    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(index: index, item: widget.items[index], onPressed: _updateIndex);
    });

    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );

  }



}