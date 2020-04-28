import 'package:a_alkarar_lab/lab_icons_icons.dart';
import 'package:a_alkarar_lab/models/staff.dart';
import 'package:a_alkarar_lab/providers/allProvider.dart';
import 'package:a_alkarar_lab/widgets/staff-template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LabScreen extends StatefulWidget {
  @override
  _LabScreenState createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  @override
  Widget build(BuildContext context) {
    final allposts = Provider.of<AllProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                const url = 'https://goo.gl/maps/t6r2eTafXP3AaQ9Q8';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/images/locations.png',
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                        size: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "العنوان",
                        style: TextStyle(
                          fontFamily: 'tajawal',
                          color: Theme.of(context).bottomAppBarColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "العراق واسط , الصويرة , مقابل مستشفى الصويرة العامة",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'tajawal',
                        color: Theme.of(context).bottomAppBarColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.call,
                        color: Theme.of(context).primaryColor,
                        size: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "الاتصال",
                        style: TextStyle(
                          fontFamily: 'tajawal',
                          color: Theme.of(context).bottomAppBarColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "- info@lab.com",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'tajawal',
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "- 07830003082",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'tajawal',
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "- 07700069771",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'tajawal',
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        LabIcons.lab_coat,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "الطاقم",
                        style: TextStyle(
                          fontFamily: 'tajawal',
                          color: Theme.of(context).bottomAppBarColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  allposts.newsDataOffline3 == null
                      ? FutureBuilder(
                          future: allposts.fetchDataStaff(),
                          builder: (ctx, authResultSnap) {
                            if (authResultSnap.connectionState ==
                                ConnectionState.waiting) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 180.0),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  strokeWidth: 2,
                                )),
                              );
                            } else if (authResultSnap.hasError) {
                              print(authResultSnap.error);
                              return RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    //other.getUserLocation();
                                  });
                                },
                                child: Text("تفقد من الاتصال بلانترنت",
                                    style: TextStyle(color: Colors.black)),
                              );
                            } else {
                              return StaffTemplate();
                            }
                          })
                      : StaffTemplate(),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
