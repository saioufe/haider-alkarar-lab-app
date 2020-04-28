import 'package:a_alkarar_lab/models/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:reviews_slider/reviews_slider.dart';
import '../providers/allProvider.dart';

class NewsPressedScreen extends StatefulWidget {
  static const routeName = '/news_pressed_screen';

  @override
  _NewsPressedScreenState createState() => _NewsPressedScreenState();
}

class _NewsPressedScreenState extends State<NewsPressedScreen> {
  @override
  void initState() {
    //postRequest('https://pandoradevs.com/getflutter.php');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postData = ModalRoute.of(context).settings.arguments as Post;

    //final loadedNews = Provider.of<OthersProvider>(context).findById(productId);
    //final List<String> texts = loadedNews.text.split("*");
    //final Widget test = loadedNews.test;
    //print(test);
    //final lang = Provider.of<Languages>(context, listen: false);
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(loadedProduct.title),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  postData.title,
                  style: TextStyle(color: Colors.white),
                ),
                background: Hero(
                  tag: postData.id,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/slide2.png'),
                    height: MediaQuery.of(context).size.height * 0.35,
                    image: NetworkImage(
                        "http://pandoradevs.com/images/posts/${postData.postImage}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          spreadRadius:
                              0.8, // has the effect of extending the shadow
                          offset: Offset(
                            0, // horizontal, move right 10
                            0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  postData.name,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'tajawal',
                                      color:
                                          Theme.of(context).bottomAppBarColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  postData.date.toString(),
                                  style: TextStyle(
                                      fontFamily: 'tajawal',
                                      color: Theme.of(context).accentColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12, left: 10),
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/images/men2.png",
                                width: 50,
                                height: 50,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        postData.text,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontFamily: 'tajawal',
                            fontSize: 20,
                            color: Theme.of(context).bottomAppBarColor,
                            height: 1.5),
                      ),
                      Divider(),
                      Text(
                        "عداد مرات القراءة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'tajawal',
                            color: Theme.of(context).bottomAppBarColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${postData.readTime} مرة",
                        style: TextStyle(fontFamily: "tajawal", fontSize: 20),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> _requestPop() {
  return new Future.value(true);
}
