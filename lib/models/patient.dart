import 'package:flutter/material.dart';
import '../models/result.dart';

class Patient {
  final String id;
  final String name;
  final String sex;
  final List<Result> results;

  Patient({
    this.id,
    this.name,
    this.sex,
    this.results,
  });
}
