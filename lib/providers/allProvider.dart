import 'dart:ffi';

import 'package:a_alkarar_lab/models/patient.dart';
import 'package:a_alkarar_lab/models/post.dart';
import 'package:a_alkarar_lab/models/staff.dart';
import 'package:a_alkarar_lab/screens/main-screen.dart';
import 'package:page_transition/page_transition.dart';
import '../models/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/slider.dart';

class AllProvider extends ChangeNotifier {
  static bool hasLogin;
  List<Post> _posts = [];
  List<Post> get posts {
    return [..._posts];
  }

  List data = [];
  List<dynamic> newsDataOffline;
  Future<void> fetchData() async {
    final response =
        await http.post('https://pandoradevs.com/get-post-flutter.php');

//print(response.body);
    data = json.decode(response.body);
    final List<Post> loadedPosts = [];
    if (data == null) {
      return;
    }
    newsDataOffline = data;
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

  List<SliderModel> _slider = [];
  List<SliderModel> get sliders {
    return [..._slider];
  }

  List data2 = [];
  List<SliderModel> loadedSlider;
  List<dynamic> newsDataOffline2;
  Future<void> fetchDataSliders() async {
    final response =
        await http.post('https://pandoradevs.com/get-slider-flutter.php');

    data2 = json.decode(response.body);
    // print(response.body);
    final List<SliderModel> loadedSlider = [];
    if (data2 == null) {
      return;
    }
    newsDataOffline2 = data2;
    data2.forEach((newsId) {
      loadedSlider.add(SliderModel(
        image: newsId['image'],
        url: newsId['url'],
      ));
    });
    _slider = loadedSlider;
    notifyListeners();
  }

  List<StaffModel> _staff = [];
  List<StaffModel> get staff {
    return [..._staff];
  }

  List data3 = [];
  List<StaffModel> loadedStaff;
  List<dynamic> newsDataOffline3;
  Future<void> fetchDataStaff() async {
    final response =
        await http.post('https://pandoradevs.com/get-staff-flutter.php');

    data3 = json.decode(response.body);
    //print(response.body);
    final List<StaffModel> loadedStaff = [];
    if (data3 == null) {
      return;
    }
    newsDataOffline3 = data3;
    data3.forEach((newsId) {
      loadedStaff.add(StaffModel(
        id: newsId['id'],
        image: newsId['image'],
        name: newsId['name'],
      ));
    });
    _staff = loadedStaff;
    notifyListeners();
  }

  List<Patient> _patient = [];
  List<Patient> get patient {
    return [..._patient];
  }

  List userData = [];
  final List<Patient> loadedPatient = [];
  Future<Void> login(
      String username, String password, BuildContext context) async {
    await http.post("http://pandoradevs.com/login-flutter.php", body: {
      "username": username,
      "password": password,
    }).then((respon) {
      userData = json.decode(respon.body);
      if (userData == null) {
        hasLogin = false;
        print("something went wrong");
      } else {
        userData.forEach((newsId) {
          loadedPatient.add(Patient(
            id: newsId['id'],
            name: newsId['name'],
            age: newsId['age'],
            sex: newsId['sex'],
            description: newsId['description'],
            date: newsId['date'],
            status: newsId['status'],
            file: newsId['file'],
          ));
        });
        hasLogin = true;

        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.downToUp, child: MainScreen(1)));
        _patient = loadedPatient;
        print(loadedPatient[0].name);
        notifyListeners();
      }
    });
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
