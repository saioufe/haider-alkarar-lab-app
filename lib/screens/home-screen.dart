import 'package:a_alkarar_lab/lab_icons_icons.dart';
import 'package:a_alkarar_lab/screens/main-screen.dart';
import 'package:a_alkarar_lab/widgets/posts-template.dart';
import 'package:a_alkarar_lab/widgets/slider-template.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/allProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final allposts = Provider.of<AllProvider>(context, listen: false);
    final allslider = Provider.of<AllProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed(MainScreen.routeName,
                //     arguments: 2);
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: MainScreen(2)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  LabIcons.microscope,
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: Text(
            'الرئيسية',
            style: TextStyle(
                fontFamily: 'tajawal',
                fontWeight: FontWeight.w500,
                color: Theme.of(context).bottomAppBarColor,
                fontSize: 28),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: allposts.newsDataOffline2 == null
                    ? FutureBuilder(
                        future: allposts.fetchDataSliders(),
                        builder: (ctx, authResultSnap) {
                          if (authResultSnap.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 180.0),
                              child: Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
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
                            return SliderTemplate();
                          }
                        })
                    : SliderTemplate(),
              ),
            ),
            allposts.newsDataOffline == null
                ? FutureBuilder(
                    future: allposts.fetchData(),
                    builder: (ctx, authResultSnap) {
                      if (authResultSnap.connectionState ==
                          ConnectionState.waiting) {
                        return Shimmer.fromColors(
                            baseColor: Theme.of(context).accentColor,
                            highlightColor: Colors.grey.withOpacity(0.2),
                            period: Duration(milliseconds: 300),
                            child: Container(
                              height: 335,
                              width: 500,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 33,
                                      spreadRadius:
                                          30.8, // has the effect of extending the shadow
                                      offset: Offset(
                                        0, // horizontal, move right 10
                                        0, // vertical, move down 10
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32))),
                            ));
                      } else if (authResultSnap.hasError) {
                        Center(
                          child: Text("تفقد من الاتصال بلانترنت"),
                        );
                        return RaisedButton(
                          onPressed: () {
                            setState(() {
                              //other.getUserLocation();
                            });
                          },
                          child: Text(authResultSnap.error.toString(),
                              style: TextStyle(color: Colors.black)),
                        );
                      } else {
                        return NewsTemplate();
                      }
                    })
                : NewsTemplate(),
            //  : NewsTemplate(),
          ],
        ),
      ),
    );
  }
}
