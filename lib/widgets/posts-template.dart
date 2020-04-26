import 'package:a_alkarar_lab/models/post.dart';
import 'package:a_alkarar_lab/screens/news-pressed-screen.dart';
import 'package:flutter/material.dart';

class NewsTemplate extends StatelessWidget {
  final Post post;

  NewsTemplate({this.post});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NewsPressedScreen.routeName,
            arguments: post);
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
                  tag: post.id,
                  child: Image.asset(post.postImage),
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
                              post.title,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'tajawal',
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
                              post.date,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'tajawal',
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
                        post.userImage,
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
