import 'package:ds_life/pages/find/find_page.dart';
import 'package:ds_life/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FramePageLogic extends GetxController {
  var selectIndex = 0.obs;
  var pages = [
    const HomePage(),
    const FindPage(),
    SizedBox.expand(
      child: Image.asset(
        "images/msg.png",
        fit: BoxFit.fitWidth,
      ),
    ),
    SizedBox.expand(
      child: Image.asset(
        "images/me.png",
        fit: BoxFit.fitWidth,
      ),
    ),
  ];
}
