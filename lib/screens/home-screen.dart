import 'package:a_alkarar_lab/lab_icons_icons.dart';
import 'package:a_alkarar_lab/models/post.dart';
import 'package:a_alkarar_lab/screens/main-screen.dart';
import 'package:a_alkarar_lab/widgets/posts-template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 170,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    "assets/images/slide3.png",
                    "assets/images/slide1.png",
                    "assets/images/slide2.png",
                    "assets/images/slide4.png"
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                            onTap: () {
                              print(i.toString());
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      image: new AssetImage(i),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            NewsTemplate(
              post: Post(
                  id: '1',
                  title: 'هنا يكتب عنوان الموضوع',
                  postImage: 'assets/images/slide3.png',
                  userImage: 'assets/images/men2.png',
                  userName: "دكتور سيف ماهر محمد",
                  date: '12/4/2020',
                  text:
                      'هذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرحهذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرحهذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح'),
            ),
            NewsTemplate(
              post: Post(
                  id: '2',
                  title: 'هنا يكتب عنوان الموضوع',
                  postImage: 'assets/images/slide2.png',
                  userImage: 'assets/images/men3.png',
                  userName: "دكتور سيف ماهر محمد",
                  date: '12/4/2020',
                  text:
                      'هذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرحهذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرحهذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح'),
            ),
            NewsTemplate(
              post: Post(
                  id: '3',
                  title: 'هنا يكتب عنوان الموضوع',
                  postImage: 'assets/images/slide1.png',
                  userImage: 'assets/images/women2.png',
                  userName: "دكتور سيف ماهر محمد",
                  date: '12/14/2020',
                  text:
                      'هذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرحهذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرحهذا هو الشرح هذا هو الشرح هذا هو الشرح هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح هذا هو الشرح'),
            )
          ],
        ),
      ),
    );
  }
}
