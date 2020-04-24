import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                child: Text(
                  productId[4],
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.tajawal().copyWith(
                      fontSize: 20,
                      color: Theme.of(context).bottomAppBarColor,
                      height: 1.5),
                ),
              ),
            ]),
          ),
        ],
      )),
    );
  }
}

Future<bool> _requestPop() {
  return new Future.value(true);
}
