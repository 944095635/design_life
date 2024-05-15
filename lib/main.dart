import 'dart:io';
import 'package:ds_life/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() async {
  // 确保屏幕尺寸工具初始化完成
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      // 默认的设计尺寸
      ScreenUtil.init(context, designSize: const Size(375, 812));
    }
    return GetMaterialApp(
      title: 'Design Life',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFD6B21),
          primary: const Color(0xFFFD6B21),
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xFF232832),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(46.h)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 10,
          height: 60,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Color(0xFFFD6B21),
        ),
      ),
      home: const SplashPage(),
      builder: FlutterSmartDialog.init(
        loadingBuilder: (msg) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingAnimationWidget.dotsTriangle(
                  color: const Color(0xFFFD6B21),
                  size: 35,
                ),
                10.verticalSpace,
                Text(msg)
              ],
            ),
          );
        },
        toastBuilder: (String msg) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(msg, style: const TextStyle(color: Colors.white)),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
