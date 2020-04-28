import 'package:flutter/material.dart';
import '../models/result.dart';

class Patient {
  final String id;
  final String name;
  final String age;
  final String sex;
  final String description;
  final String date;
  final String status;
  final String file;

  Patient({
    this.id,
    this.name,
    this.age,
    this.sex,
    this.description,
    this.date,
    this.status,
    this.file,
  });
}
