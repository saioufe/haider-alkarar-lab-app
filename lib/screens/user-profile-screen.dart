import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'صفحتي',
                  style: GoogleFonts.tajawal().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bottomAppBarColor,
                      fontSize: 28),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
