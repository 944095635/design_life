import 'package:get/get.dart';

/// 兴趣点
class Interest {
  late String id;
  late String title;
  late RxBool like;

  Interest({
    required this.id,
    required this.like,
    required this.title,
  });
}
