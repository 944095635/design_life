import 'package:ds_life/modesl/find_item.dart';
import 'package:get/get.dart';

class FindPageLogic extends GetxController with StateMixin<List> {
  @override
  void onInit() {
    super.onInit();
    value = [];

    for (var i = 0; i < 10; i++) {
      value!.add(FindItem(
          id: "0", title: "午餐君 - X", like: RxBool(false), name: "凯特琳"));
      value!.add(FindItem(
          id: "1", title: "心语蛋糕店", like: RxBool(false), name: "Linda"));
      value!.add(
          FindItem(id: "2", title: "兰博基尼", like: RxBool(false), name: "林丹丹"));
      value!.add(
          FindItem(id: "3", title: "高达", like: RxBool(false), name: "萧亚轩"));
    }

    change(value, status: RxStatus.success());
  }
}
