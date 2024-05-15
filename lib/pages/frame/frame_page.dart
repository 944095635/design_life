import 'package:ds_life/pages/frame/frame_page_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 主页面
class FramePage extends GetView<FramePageLogic> {
  const FramePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FramePageLogic());
    return Scaffold(
        body: Obx(
          () => controller.pages[controller.selectIndex.value],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: buildBottomAppBarItem("首页", 0)),
              Expanded(child: buildBottomAppBarItem("发现", 1)),
              Expanded(child: buildBottomAppBarItem("消息", 2)),
              Expanded(child: buildBottomAppBarItem("我的", 3)),
            ],
          ),
        ));
  }

  Widget buildBottomAppBarItem(String title, int id) {
    return GestureDetector(
      onTap: () {
        controller.selectIndex.value = id;
      },
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Obx(
          () => Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: controller.selectIndex.value == id
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: controller.selectIndex.value == id
                  ? const Color(0xFFFE471D)
                  : const Color(0xFF787B86),
            ),
          ),
        ),
      ),
    );
  }
}
