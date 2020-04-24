import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/men.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "سيف ماهر محمد",
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff313e4b),
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
                    Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "الجنس : ذكر",
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      spreadRadius:
                          0.3, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        0, // vertical, move down 10
                      ),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: null,
                      child: Text(
                        "الكل",
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xff313e4b),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    VerticalDivider(thickness: 1),
                    InkWell(
                      onTap: null,
                      child: Text(
                        "جديد",
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xff313e4b),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    VerticalDivider(thickness: 1),
                    InkWell(
                      onTap: null,
                      child: Text(
                        "المهمة",
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xff313e4b),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
