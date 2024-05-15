import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            isScrollable: true,
            dividerHeight: 0,
            indicator: const BoxDecoration(),
            tabAlignment: TabAlignment.start,
            splashFactory: NoSplash.splashFactory,
            //splashBorderRadius: BorderRadius.circular(5.r),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            labelStyle: TextStyle(
              fontSize: 20.sp,
              color: const Color(0xFF232832),
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF787B86),
            ),
            tabs: const [
              Tab(
                text: "推荐",
              ),
              Tab(
                text: "附近的",
              ),
            ],
          ),
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
        backgroundColor: const Color(0xFFF4F4F7),
        body: ListView(
          padding: EdgeInsets.all(20.w),
          children: [
            buildNominate(),
            26.verticalSpace,
            buildImageCard(
                like: true, user: "云图六重奏歌剧", image: "images/home/home1.png"),
            20.verticalSpace,
            buildImageCard(user: "银骑士射箭俱乐部", image: "images/home/home2.png"),
            26.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "人气会员",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xff232832),
                  ),
                ),
                const Spacer(),
                Text(
                  "看更多",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFFD6B21),
                  ),
                ),
                4.horizontalSpace,
                Icon(
                  CupertinoIcons.arrow_right_circle,
                  size: 16.sp,
                  color: const Color(0xFFFD6B21),
                )
              ],
            ),
            13.verticalSpace,
            buildVipTitle(),
          ],
        ),
      ),
    );
  }

  /// 推荐用户
  Widget buildNominate() {
    // 18 - 15
    return SizedBox(
      height: 86.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildNominateItem("user1", "Mark Liu", first: true),
          30.horizontalSpace,
          buildNominateItem("user2", "贝鲁妮"),
          30.horizontalSpace,
          buildNominateItem("user3", "王大"),
          30.horizontalSpace,
          buildNominateItem("user4", "钢加农"),
          30.horizontalSpace,
          buildNominateItem("user5", "Kassandre"),
          30.horizontalSpace,
          buildNominateItem("user6", "Erica Zhao"),
          30.horizontalSpace,
          buildNominateItem("user7", "Outfit"),
        ],
      ),
    );
  }

  /// 推荐用户 - 头像+名称
  Widget buildNominateItem(String id, String title, {bool first = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 62.w,
          height: 62.w,
          child: Stack(
            children: [
              Image.asset(
                "images/home/users/$id.png",
                fit: BoxFit.cover,
                width: 62.w,
                height: 62.w,
              ),
              if (first) ...{
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Icon(
                      CupertinoIcons.plus_circle_fill,
                      size: 20.w,
                      color: const Color(0xFFFD6B21),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff232832),
          ),
        )
      ],
    );
  }

  /// 卡片
  Widget buildImageCard({
    bool like = false,
    required String user,
    required String image,
  }) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(16.r)),
              //image: DecorationImage(
              //  image: AssetImage("images/home/home1.png"),
              //  fit: BoxFit.cover,
              //),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 25.w,
                    height: 25.w,
                    child: CircleAvatar(
                      foregroundImage: AssetImage(image),
                    ),
                  ),
                  6.horizontalSpace,
                  Expanded(
                    child: Text(
                      user,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xff232832),
                      ),
                    ),
                  ),
                  6.horizontalSpace,
                  Image.asset(
                    like ? "images/home/like.webp" : "images/home/like_no.webp",
                    width: 20.w,
                    height: 20.w,
                  ),
                  3.horizontalSpace,
                  Text(
                    "2.4K",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: like
                          ? const Color(0xffFE471D)
                          : const Color(0xff232832),
                    ),
                  ),
                  14.horizontalSpace,
                  Image.asset(
                    "images/home/talk.webp",
                    width: 20.w,
                    height: 20.w,
                  ),
                  3.horizontalSpace,
                  Text(
                    "256",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff232832),
                    ),
                  )
                  //Montserrat
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 人气会员 - 更多
  buildVipTitle() {
    return SizedBox(
      height: 210.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildVipItem("user1", "Mark Liu", "游戏 ,动漫", like: true),
          10.horizontalSpace,
          buildVipItem("user2", "贝鲁妮", "游戏 ,动漫"),
          10.horizontalSpace,
          buildVipItem("user3", "王大", "游戏 ,动漫"),
          10.horizontalSpace,
          buildVipItem("user4", "钢加农", "游戏 ,动漫"),
          10.horizontalSpace,
          buildVipItem("user5", "Kassandre", "游戏 ,动漫"),
          10.horizontalSpace,
          buildVipItem("user6", "Erica Zhao", "游戏 ,动漫"),
          10.horizontalSpace,
          buildVipItem("user7", "Outfit", "游戏 ,动漫"),
        ],
      ),
    );
  }

  /// 推荐用户 - 头像+名称
  Widget buildVipItem(
    String id,
    String title,
    String tips, {
    bool like = false,
  }) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.verticalSpace,
          Image.asset(
            "images/home/users/$id.png",
            fit: BoxFit.cover,
            width: 54.w,
            height: 54.w,
          ),
          6.verticalSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF232832),
            ),
          ),
          Text(
            tips,
            style: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF787B86),
            ),
          ),
          6.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                like ? "images/home/like.webp" : "images/home/like_no.webp",
                width: 20.w,
                height: 20.w,
              ),
              3.horizontalSpace,
              Text(
                "2.4K",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color:
                      like ? const Color(0xffFE471D) : const Color(0xff232832),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFD6B21),
                borderRadius: BorderRadius.circular(6.r)),
            width: 45.w,
            height: 30.h,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
