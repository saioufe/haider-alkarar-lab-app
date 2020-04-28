import 'package:a_alkarar_lab/providers/allProvider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allPosts = Provider.of<AllProvider>(context, listen: false);

    return CarouselSlider.builder(
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
      itemCount: allPosts.sliders.length,
      itemBuilder: (BuildContext context, int itemIndex) => InkWell(
          onTap: () async {
            final url = allPosts.sliders[itemIndex].url;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://pandoradevs.com/images/slider/${allPosts.sliders[itemIndex].image}"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
