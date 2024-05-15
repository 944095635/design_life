import 'package:ds_life/pages/init/init_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/splash_bg.png",
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color.fromRGBO(5, 16, 40, 0.7),
          ),
          SafeArea(
            child: Column(
              children: [
                60.verticalSpace,
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    "Design Life",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                20.verticalSpace,
                const Text(
                  "分享你的爱好和生活",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: FilledButton(
                    onPressed: login,
                    child: const Text("本机号码登录/注册"),
                  ),
                ),
                100.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  void init(BuildContext context) async {}

  void login() async {
    await SmartDialog.showLoading(
        displayTime: const Duration(seconds: 2), msg: "登录中..");
    Get.to(() => const InitPage());
  }
}
