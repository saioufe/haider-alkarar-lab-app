import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';

class NewsPressedScreen extends StatelessWidget {
  static const routeName = '/news_pressed_screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as List<String>;
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
                  productId[0],
                  style: TextStyle(color: Colors.white),
                ),
                background: Hero(
                  tag: productId[5],
                  child: Image.asset(
                    productId[2],
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
                          Expanded(
                            child: Text(
                              productId[3] ,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'tajawal',
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          Container(
                            width: 210,
                            child: Text(
                              "دكتور سيف ماهر",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'tajawal',
                                  color: Theme.of(context).bottomAppBarColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12, left: 10),
                            child: ClipRRect(
                              child: Image.asset(
                                productId[1],
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
                        productId[4],
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
                        "ما مدى تقييمك للموضوع ؟",
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
                      ReviewSlider(
                          circleDiameter: 50,
                          options: ["سيء", "متوسط", "جيد", "جيد جدا", "ممتاز"],
                          onChange: (int value) {
                            // active value is an int number from 0 to 4, where:
                            // 0 is the worst review value
                            // and 4 is the best review value
                            print(value);
                          }),
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
