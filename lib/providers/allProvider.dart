import 'package:a_alkarar_lab/models/post.dart';
import '../models/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AllProvider extends ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts {
    return [..._posts];
  }

  Map<String, dynamic> newsDataOffline;

  // Future<void> getRequest(String url) async {
  //   final response = await http.get(url);
  //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //   print(response.body);
  //   final List<Post> loadedPosts = [];
  //   if (extractedData == null) {
  //     return;
  //   }

  //   newsDataOffline = extractedData;
  //   extractedData.forEach((newsId, newsData) {
  //     loadedPosts.add(Post(
  //       id: newsData['id'],
  //       title: newsData['title'],
  //       text: newsData['text'],
  //       date: newsData['date'],
  //       postImage: newsData['post-imag'],
  //       readTime: newsData['read-time'],
  //       name: newsData['name'],
  //     ));
  //   });

  //   _posts = loadedPosts;
  //   notifyListeners();
  // }

  List data = [];

  Future<void> fetchData() async {
    final response =
        await http.get('https://pandoradevs.com/get-posts-flutter.php');
print(response.body);
    data = json.decode(response.body);
    final List<Post> loadedPosts = [];
    if (data == null) {
      return;
    }

    data.forEach((newsId) {
      loadedPosts.add(Post(
        id: newsId["id"],
        title: newsId["title"],
        text: newsId["text"],
        date: newsId["date"],
        postImage: newsId["post-image"],
        readTime: newsId["read-time"],
        name: newsId["name"],
      ));
    });
    _posts = loadedPosts;
    notifyListeners();

    //_posts = data;
    // print(response.body);
  }

  List<UserPortfolio> _slider = [];
  List<UserPortfolio> get sliders {
    return [..._slider];
  }

  List data2 = [];
  List<UserPortfolio> loadedSlider;
  Future<void> fetchDataSliders() async {
    final response =
        await http.get('https://pandoradevs.com/get-slider-flutter.php');

    data2 = json.decode(response.body);
    print(response.body);
    final List<UserPortfolio> loadedSlider = [];
    if (data2 == null) {
      return;
    }

    data2.forEach((newsId) {
      loadedSlider.add(UserPortfolio(
        id: newsId["id"],
        image: newsId['image'],
        url: newsId['url'],
      ));
    });
    _slider = loadedSlider;
    notifyListeners();
    //_posts = data;
    // print(response.body);
  }

  Future<bool> checkConnection() async {
    final url = 'http://pandoradevs.com/get-posts-flutter.php';
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return false;
    }
    return true;
  }
}
