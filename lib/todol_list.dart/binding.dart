import 'package:get/get.dart';
import 'package:todo/todol_list.dart/controller.dart';
class mytodo extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Todo_controller());
  }
}