import 'package:flutter/material.dart';

class Post {
  final String id;
  final String title;
  final String text;
  final String date;
  final String postImage;
  final String userImage;
  final int readTime;
  final int veryBad;
  final int bad;
  final int good;
  final int veryGood;
  final int excelent;

  Post({
    this.id,
    this.title,
    this.text,
    this.date,
    this.postImage,
    this.userImage,
    this.readTime,
    this.veryBad,
    this.bad,
    this.good,
    this.veryGood,
    this.excelent,
  });
}
