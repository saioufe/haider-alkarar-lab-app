import 'package:a_alkarar_lab/screens/empty-order-screen.dart';
import 'package:a_alkarar_lab/screens/home-screen.dart';
import 'package:a_alkarar_lab/screens/order-screen.dart';
import 'package:a_alkarar_lab/screens/user-profile-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  //final List<Meal> favoriteMeals;
  //MainScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<MainScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'profile',
      },
      {
        'page': OrderScreen(),
        'title': 'order',
      },
      {
        'page': UserProfileScreen(),
        'title': 'home',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
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
                  Icons.apps,
                  size: 25,
                ),
              ),
              title: Text(
                'الرئيسية',
                style: GoogleFonts.tajawal(),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 25,
                ),
              ),
              title: Text(
                'الطلبات',
                style: GoogleFonts.tajawal(),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.account_box,
                  size: 25,
                ),
              ),
              title: Text(
                'صفحتي',
                style: GoogleFonts.tajawal(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
