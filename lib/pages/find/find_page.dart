import 'package:ds_life/modesl/find_item.dart';
import 'package:ds_life/pages/find/find_page_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FindPage extends GetView<FindPageLogic> {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FindPageLogic());
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        title: const Text("发现"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "images/home/search.webp",
              width: 18.w,
              height: 18.w,
            ),
          )
        ],
      ),
      body: controller.obx(
        (value) => MasonryGridView.count(
          padding: EdgeInsets.all(20.w),
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          itemCount: value!.length,
          crossAxisSpacing: 12.w,
          itemBuilder: (BuildContext context, int index) {
            FindItem item = value[index];
            return GestureDetector(
              onTap: () {
                item.like.value = !item.like.value;
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  10.verticalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Image.asset(
                      "images/find/${item.id}.webp",
                      height: (index % 2 + 1) * 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    item.title,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(color: Color(0xFF787B86)),
                      ),
                      const Spacer(),
                      Image.asset(
                        "images/home/like_no.webp",
                        width: 16.w,
                        height: 16.w,
                      ),
                      3.horizontalSpace,
                      Text(
                        "6K",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff232832),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
