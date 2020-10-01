import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/category_screen.dart';
import 'package:restaurant_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  Widget cakkPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return CategoryScreen();
      case 1:
        return Favourite();
        break;
      default:
        return CategoryScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple,
          fixedColor: Colors.amber,
          currentIndex: _currentIndex,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.all_inclusive,
                ),
                title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.all_out), title: Text('all'))
          ]),
      body: cakkPage(_currentIndex),
    );
  }
}
