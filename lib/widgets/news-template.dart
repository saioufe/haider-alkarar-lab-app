import 'package:a_alkarar_lab/screens/news-pressed-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTemplate extends StatelessWidget {
  final String id;
  final String title;
  final String text;
  final String date;
  final String userImage;
  final String postImage;

  NewsTemplate({
    this.id,
    this.title,
    this.postImage,
    this.userImage,
    this.date,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NewsPressedScreen.routeName,
            arguments: [title, userImage, postImage, date, text, id]);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Hero(
                  tag: id,
                  child: Image.asset(postImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        print("clicked");
                      },
                      child: Icon(Icons.share,
                          color: Theme.of(context).bottomAppBarColor),
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              title,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.tajawal().copyWith(
                                  color: Theme.of(context).bottomAppBarColor,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              date,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.tajawal().copyWith(
                                color: Theme.of(context)
                                    .bottomAppBarColor
                                    .withOpacity(0.5),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      child: Image.asset(
                        userImage,
                        width: 50,
                        height: 50,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
