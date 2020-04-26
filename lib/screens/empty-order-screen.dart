import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class EmptyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Center(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 1.5,
            //     height: 35,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(10),
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black12,
            //           blurRadius: 20,
            //           spreadRadius:
            //               0.3, // has the effect of extending the shadow
            //           offset: Offset(
            //             0, // horizontal, move right 10
            //             0, // vertical, move down 10
            //           ),
            //         )
            //       ],
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: <Widget>[
            //         InkWell(
            //           onTap: null,
            //           child: Text(
            //             "الكل",
            //             style: TextStyle(
            //               fontWeight: FontWeight.w100,
            //               fontSize: 20,
            //               color: Color(0xff313e4b),
            //             ),
            //             textDirection: TextDirection.rtl,
            //           ),
            //         ),
            //         VerticalDivider(thickness: 1),
            //         InkWell(
            //           onTap: null,
            //           child: Text(
            //             "جديد",
            //             style: TextStyle(
            //               fontWeight: FontWeight.w100,
            //               fontSize: 20,
            //               color: Color(0xff313e4b),
            //             ),
            //             textDirection: TextDirection.rtl,
            //           ),
            //         ),
            //         VerticalDivider(thickness: 1),
            //         InkWell(
            //           onTap: null,
            //           child: Text(
            //             "المهمة",
            //             style: TextStyle(
            //               fontWeight: FontWeight.w100,
            //               fontSize: 20,
            //               color: Color(0xff313e4b),
            //             ),
            //             textDirection: TextDirection.rtl,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Image.asset(
              "assets/images/empty_order.png",
              width: 300,
              height: 220,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "لا يوجد نتائج",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Color(0xff313e4b),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 280,
                child: Text(
                  "سجل الدخول بحسابك لمشاهدة نتائج التحاليل او انتظر بعض الوقت لظهور النتائج في هذه الصفحة",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 19,
                    color: Color(0xff313e4b),
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(15),
                width: 190,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      spreadRadius:
                          0.48, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        15, // vertical, move down 10
                      ),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      FlutterIcons.sign_in_alt_faw5s,
                      color: Colors.white,
                    ),
                    Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          fontFamily: 'tajawal',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
