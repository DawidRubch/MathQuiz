import 'package:flutter/material.dart';

//Size of the entire screen
Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

//Height of the screen
double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

//Width of the screen
double displayWidth(BuildContext context) {
  return displaySize(context).width;
}
