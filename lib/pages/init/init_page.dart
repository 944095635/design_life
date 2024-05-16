import 'package:ds_life/modesl/interest.dart';
import 'package:ds_life/pages/init/init_page_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class InitPage extends GetView<InitPageLogic> {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InitPageLogic());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: ListView(
                children: [
                  Text(
                    "欢迎来到「Design Life」",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  6.verticalSpace,
                  const Text(
                    "请选择您感兴趣的类别",
                    style: TextStyle(
                      color: Color(0xFF787B86),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  40.verticalSpace,
                  controller.obx(
                    (value) => MasonryGridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 30.h,
                      itemCount: value!.length,
                      crossAxisSpacing: 14.w,
                      itemBuilder: (BuildContext context, int index) {
                        Interest item = value[index];
                        return GestureDetector(
                          onTap: () {
                            item.like.value = !item.like.value;
                          },
                          child: buildItem(item),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
            ),
            child: FilledButton(
              onPressed: controller.join,
              child: const Text("进入"),
            ),
          ),
        ],
      ),
    );
  }

  /// 感兴趣的类别
  Widget buildItem(Interest item) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              "images/init/${item.id}.png",
              height: 100.h,
              fit: BoxFit.cover,
            ),
            14.verticalSpace,
            Text(
              item.title,
              style: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xFF787B86),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Positioned(
          right: 6.w,
          top: 6.h,
          child: Obx(
            () => Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: item.like.value
                    ? const Color(0xFFFD6B21)
                    : const Color.fromARGB(125, 17, 17, 24),
              ),
              child: Icon(
                CupertinoIcons.checkmark_alt,
                size: 18.w,
                color: item.like.value ? Colors.white : const Color(0xFFC5C5D1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
