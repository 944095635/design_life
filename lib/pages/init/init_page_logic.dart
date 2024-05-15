import 'package:ds_life/modesl/interest.dart';
import 'package:ds_life/pages/frame/frame_page.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class InitPageLogic extends GetxController with StateMixin<List> {
  @override
  void onInit() {
    super.onInit();
    value = [];

    value!.add(Interest(id: "gw", title: "购物", like: RxBool(false)));
    value!.add(Interest(id: "ms", title: "美食", like: RxBool(false)));
    value!.add(Interest(id: "lx", title: "旅行", like: RxBool(false)));
    value!.add(Interest(id: "sm", title: "数码", like: RxBool(false)));
    value!.add(Interest(id: "sy", title: "摄影", like: RxBool(false)));
    value!.add(Interest(id: "yx", title: "游戏", like: RxBool(false)));
    value!.add(Interest(id: "dm", title: "动漫", like: RxBool(false)));
    value!.add(Interest(id: "dy", title: "电影", like: RxBool(false)));
    value!.add(Interest(id: "cw", title: "宠物", like: RxBool(false)));

    change(value, status: RxStatus.success());
  }

  void join() async {
    Get.offAll(() => const FramePage(), transition: Transition.rightToLeft);
    SmartDialog.showToast("已保存");
  }
}
