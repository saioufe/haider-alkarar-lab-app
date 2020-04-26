import 'package:a_alkarar_lab/lab_icons_icons.dart';
import 'package:a_alkarar_lab/screens/empty-order-screen.dart';
import 'package:a_alkarar_lab/screens/home-screen.dart';
import 'package:a_alkarar_lab/screens/lab-screen.dart';
import 'package:a_alkarar_lab/screens/login-screen.dart';
import 'package:a_alkarar_lab/screens/result-screen.dart';
import 'package:a_alkarar_lab/screens/lab-screen.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  //final List<Meal> favoriteMeals;
  //MainScreen(this.favoriteMeals);
  final int index;
  MainScreen(this.index);
  static const routeName = '/main_Screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<MainScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex;
  bool oneEnter = false;
  @override
  void initState() {
    if (widget.index == 2) {
      _selectedPageIndex = 2;
    } else {
      _selectedPageIndex = 0;
    }
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'profile',
      },
      {
        'page': ResultsScreen(),
        'title': 'order',
      },
      {
        'page': LabScreen(),
        'title': 'home',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedPageIndex]['title']),
      // ),
      //drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white),
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Theme.of(context).bottomAppBarColor,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedFontSize: 18,
          unselectedFontSize: 16,
          currentIndex: _selectedPageIndex,
          elevation: 0,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  LabIcons.benzene,
                  size: 25,
                ),
              ),
              title: Text(
                'الرئيسية',
                style: TextStyle(fontFamily: 'tajawal'),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  LabIcons.flask,
                  size: 25,
                ),
              ),
              title: Text(
                'التحاليل',
                style: TextStyle(fontFamily: 'tajawal'),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  LabIcons.microscope,
                  size: 25,
                ),
              ),
              title: Text(
                'المختبر',
                style: TextStyle(fontFamily: 'tajawal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
