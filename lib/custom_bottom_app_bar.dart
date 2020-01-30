import 'package:flutter/material.dart';

class CustomAppBarItem {
  IconData icon;
  bool hasNotification;

  CustomAppBarItem({this.icon, this.hasNotification = false});
}

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<CustomAppBarItem> items;

  CustomBottomAppBar({this.onTabSelected, this.items}) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabIcon(
          index: index, item: widget.items[index], onPressed: _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleSeparator());

    return BottomAppBar(
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }

  Widget _buildMiddleSeparator() {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon(
      {int index, CustomAppBarItem item, ValueChanged<int> onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: item.hasNotification
                ? Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: _selectedIndex == index
                            ? Colors.blue[900]
                            : Colors.grey,
                        size: 24.0,
                      ),
                      Positioned(
                        top: 16.0,
                        right: 22.0,
                        child: Icon(
                          Icons.brightness_1,
                          color: Color(0xffC5002D),
                          size: 10.0,
                        ),
                      )
                    ],
                  )
                : Icon(
                    item.icon,
                    color: _selectedIndex == index ? Colors.blue : Colors.grey,
                    size: 24.0,
                  ),
          ),
        ),
      ),
    );
  }
}
