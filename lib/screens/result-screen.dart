import 'package:a_alkarar_lab/models/result.dart';
import 'package:flutter/material.dart';
import '../widgets/order-item.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  double _progressSlideSheet = 0;
  @override
  Widget build(BuildContext context) {
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
                          child: Image.asset(
                            'assets/images/women2.png',
                            width: 100,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "سيف ماهر محمد",
                    style: TextStyle(
                      fontFamily: 'tajawal',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff313e4b),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "الجنس : ذكر",
                    style: TextStyle(
                      fontFamily: 'tajawal',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                    textDirection: TextDirection.rtl,
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
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                right: 50,
                child: AnimatedPadding(
                  padding: EdgeInsets.only(top: 365 - _progressSlideSheet * 80),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  child: Text(
                    '19/4/2020',
                    style: TextStyle(
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                        fontSize: 18),
                  ),
                ),
              ),
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
                          child: FlatButton(
                        focusColor: Colors.red,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Theme.of(context).bottomAppBarColor,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.file_download),
                              Text("تحميل",
                                  style: TextStyle(
                                      fontFamily: 'tajawal',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      )),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                left: 50,
                child: AnimatedPadding(
                  padding: EdgeInsets.only(top: 355 - _progressSlideSheet * 80),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  child: Text(
                    'سيف ماهر محمد',
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
                                      id: "1",
                                      name: "سيف ماهر محمد",
                                      date: "19/3/2020",
                                      download: "download 1"),
                                ),
                                OrderItem(
                                  result: Result(
                                      id: "2",
                                      name: "علي عبد الواحد جبار",
                                      date: "19/3/2019",
                                      download: "download 2"),
                                ),
                                OrderItem(
                                  result: Result(
                                      id: "3",
                                      name: "غيث احمد ممتاز",
                                      date: "1/1/2001",
                                      download: "download 3"),
                                ),
                                OrderItem(
                                  result: Result(
                                      id: "4",
                                      name: "ضحى ناطق يحيى",
                                      date: "12/5/2020",
                                      download: "download 4"),
                                ),
                                OrderItem(
                                  result: Result(
                                      id: "5",
                                      name: "محمد جمال الدين",
                                      date: "12/5/2019",
                                      download: "download 5"),
                                ),
                                OrderItem(
                                  result: Result(
                                      id: "6",
                                      name: "ليث عبد الله",
                                      date: "29/1/2020",
                                      download: "download 6"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
