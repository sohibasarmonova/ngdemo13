import 'package:get/get.dart';
import 'package:ngdemo13/controllers/home_controller.dart';

import '../controllers/addpost_contiroller.dart';
import '../controllers/update_controller.dart';

class RootBinding implements Bindings{
@override
  void dependencies() {
    // TODO: implement dependencies
  Get.lazyPut(() => HomeController(),fenix:true );
  Get.lazyPut(() => AddPostController(), fenix: true);
  Get.lazyPut(() => UpdateController(), fenix: true);
  }
}