import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';
import '../models/post_res_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class AddPostController extends GetxController{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  addPost() async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    Post post = Post(userId: 1,title: title, body: body);

    var response = await Network.POST(Network.API_POST_CREATE, Network.paramsCreate(post));
    LogService.d(response!);
    PostRes postRes = Network.parsePostRes(response);
    backToFinish();
  }

  backToFinish(){
    Get.back(result:true);
  }

}