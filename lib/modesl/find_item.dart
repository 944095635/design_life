import 'package:get/get.dart';

/// 查找项
class FindItem {
  late String id;
  late String title;
  late String name;
  late RxBool like;

  FindItem({
    required this.id,
    required this.like,
    required this.title,
    required this.name,
  });
}
