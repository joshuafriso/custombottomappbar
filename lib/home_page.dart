import 'package:flutter/material.dart';
import 'package:custombottomappbar/custom_bottom_app_bar.dart';
import 'package:custombottomappbar/floating_button_animated.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _lastSelected = "TAB: 0";

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = "TAB: $index";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom BottomAppBar"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButtonAnimated(),
      bottomNavigationBar: CustomBottomAppBar(
        onTabSelected: _selectedTab,
        items: [
          CustomAppBarItem(icon: Icons.home),
          CustomAppBarItem(icon: Icons.shopping_cart, hasNotification: true),
          CustomAppBarItem(icon: Icons.list),
          CustomAppBarItem(icon: Icons.person),
        ],
      ),
    );
  }
}
