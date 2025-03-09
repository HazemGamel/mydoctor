import 'package:flutter/material.dart';

class Responsive {
  static width(double size, BuildContext context) {
    return MediaQuery.of(context).size.width * (size / 100);
  }

  static height(double size, BuildContext context) {
    return MediaQuery.of(context).size.height * (size / 100);
  }
  
}

double height(context,value) {
  return MediaQuery.of(context).size.height/value;
}

double width(context) {
  return MediaQuery.of(context).size.width;
}
