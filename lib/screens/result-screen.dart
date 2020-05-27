import 'package:a_alkarar_lab/models/result.dart';
import 'package:a_alkarar_lab/providers/allProvider.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/order-item.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'main-screen.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

Color notificationColor = Colors.green;
bool notificationIsActive = true;
String notificationText = "مفعل";

class _ResultsScreenState extends State<ResultsScreen> {
  void initState() {
    checkNotification();
  }

  void checkNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("notification")) {
      notificationIsActive = prefs.getBool("notification");
    }

    if (notificationIsActive == true) {
      await OneSignal.shared.setSubscription(true);
      setState(() {
        notificationText = "مفعل";
        notificationColor = Colors.green;
      });
    } else {
      await OneSignal.shared.setSubscription(false);
      setState(() {
        notificationText = "متوقف";
        notificationColor = Colors.red;
      });
    }
    print(notificationIsActive);
  }

  double _progressSlideSheet = 0;
  @override
  Widget build(BuildContext context) {
    final allposts = Provider.of<AllProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          elevation: 0,
          title: Text(
            'التحاليل',
            style: TextStyle(
                fontFamily: 'tajawal',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28),
          )),
      body: SingleChildScrollView(
        child: Container(
          height: 710,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Theme.of(context).bottomAppBarColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.elliptical(200, 100),
                              bottomLeft: Radius.elliptical(200, 100),
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 7),
                            shape: BoxShape.circle),
                        child: ClipOval(
                            child: allposts.patient[0].sex == "انثى"
                                ? Image.asset(
                                    'assets/images/women2.png',
                                    width: 100,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/men2.png',
                                    width: 100,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    allposts.patient[0].name,
                    style: TextStyle(
                      fontFamily: 'tajawal',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff313e4b),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "الجنس : ${allposts.patient[0].sex}",
                  //   style: TextStyle(
                  //     fontFamily: 'tajawal',
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 20,
                  //     color: Theme.of(context).accentColor,
                  //   ),
                  //   textDirection: TextDirection.rtl,
                  // ),
                  InkWell(
                    onTap: () async {
                      AllProvider.hasLogin = false;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.upToDown,
                              child: MainScreen(0)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("تسجيل الخروج",
                          style: TextStyle(
                              fontFamily: 'tajawal',
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        notificationIsActive = !notificationIsActive;
                        prefs.setBool("notification", notificationIsActive);
                      });
                      if (notificationIsActive == true) {
                        setState(() {
                          notificationText =
                              "مفعل";
                          notificationColor = Colors.green;
                        });
                      } else {
                        setState(() {
                          notificationText =
                              "متوقف";
                          notificationColor = Colors.red;
                        });
                      }
                    },
                    child: new SettingBar(
                      "تفعيل الاشعارات",
                      Text(
                        notificationIsActive == true ? "مفعل" : "متوقف",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: notificationColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 240, left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 10,
                                offset: Offset(0, 2))
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Color(0xff37c5d2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      duration: Duration(milliseconds: 500),
                      height: _progressSlideSheet == 0
                          ? 180
                          : 180 - _progressSlideSheet * 65,
                      curve: Curves.elasticOut,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // AnimatedPositioned(
              //   duration: Duration(milliseconds: 500),
              //   curve: Curves.elasticOut,
              //   right: 50,
              //   child: AnimatedPadding(
              //     padding: EdgeInsets.only(top: 365 - _progressSlideSheet * 80),
              //     duration: Duration(milliseconds: 500),
              //     curve: Curves.elasticOut,
              //     child: Text(
              //       allposts.patient[0].date,
              //       style: TextStyle(
              //           fontFamily: 'tajawal',
              //           fontWeight: FontWeight.w100,
              //           color: Colors.white70,
              //           fontSize: 18),
              //     ),
              //   ),
              // ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 50),
                  opacity: 1 - _progressSlideSheet,
                  child: AnimatedPadding(
                    padding: EdgeInsets.only(top: 260),
                    duration: Duration(milliseconds: 500),
                    curve: Curves.elasticOut,
                    child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: SingleChildScrollView(
                            child: allposts.patient[0].status == "f"
                                ? FlatButton(
                                    focusColor: Colors.red,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    color: Theme.of(context).bottomAppBarColor,
                                    child: Center(
                                      child: FlatButton(
                                        onPressed: () async {
                                          // final taskId = await FlutterDownloader.enqueue(
                                          //   url:
                                          //       'bin/dl.cgi/v376mg4vg73joepvvlg4lmdn7j3khyja6l2a22q6wfi7gqegypm2t3y/793176674_Sharp_Textures.zip',
                                          //   savedDir: 'download',
                                          //   showNotification:
                                          //       true, // show download progress in status bar (for Android)
                                          //   openFileFromNotification:
                                          //       true, // click on notification to open downloaded file (for Android)
                                          // );

                                          String url =
                                              '${AllProvider.hostName}/results/${allposts.patient[0].file}';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Icon(
                                              Icons.file_download,
                                              color: Colors.white,
                                            ),
                                            Text("تحميل",
                                                style: TextStyle(
                                                    fontFamily: 'tajawal',
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                  )
                                : SizedBox(
                                    height: 1,
                                  ))),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                left: 100,
                child: AnimatedPadding(
                  padding: EdgeInsets.only(top: 350 - _progressSlideSheet * 80),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  child: allposts.patient[0].status == "s"
                      ? Text(
                          'النتيجة لم ترفع الى الان',
                          style: TextStyle(
                              fontFamily: 'tajawal',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        )
                      : Text(
                          'تم رفع النتيجة',
                          style: TextStyle(
                              fontFamily: 'tajawal',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28),
                        ),
                ),
              ),
              SlidingSheet(
                listener: (state) {
                  setState(() {
                    _progressSlideSheet = state.progress;
                  });
                },
                elevation: 5,
                cornerRadius: 20,
                shadowColor: Colors.grey[300],
                maxWidth: MediaQuery.of(context).size.width / 1.2,
                closeOnBackdropTap: true,
                snapSpec: const SnapSpec(
                  snappings: [
                    0.40,
                    0.72,
                  ],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                builder: (context, state) {
                  return Container(
                    color: Color(0xfff7f7f7),
                    height: MediaQuery.of(context).size.height / 1.8,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        _progressSlideSheet < 1
                            ? AnimatedOpacity(
                                opacity: 1 - _progressSlideSheet,
                                duration: Duration(milliseconds: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Feather.chevron_up,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('اسحب الى الاعلى للاخفاء',
                                        style: TextStyle(
                                            fontFamily: 'tajawal',
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ],
                                ),
                              )
                            : AnimatedOpacity(
                                opacity: _progressSlideSheet,
                                duration: Duration(milliseconds: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Feather.chevron_down,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('اسحب الى الاسفل لعرض المزيد',
                                        style: TextStyle(
                                            fontFamily: 'tajawal',
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 60,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 5,
                              width: 60,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                OrderItem(
                                  result: Result(
                                      id: allposts.patient[0].id,
                                      name: allposts.patient[0].name,
                                      date: allposts.patient[0].date,
                                      download: allposts.patient[0].file),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class SettingBar extends StatelessWidget {
  SettingBar(this.title, this.child);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 30,
      width: 380,
      padding: EdgeInsets.only(right: 30, left: 30),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Theme.of(context).bottomAppBarColor.withOpacity(0.1),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.0,
              color: Theme.of(context).bottomAppBarColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
