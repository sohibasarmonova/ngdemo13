
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/post_model.dart';

import '../pages/add_post_page.dart';
import '../pages/update_page.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';


class HomeController extends GetxController {
  bool isLoading = true;
  List<Post> posts = [];

  loadPosts() async {
    isLoading = true;
    update();

    var response = await Network.GET(
        Network.API_POST_LIST, Network.paramsEmpty());
    LogService.d(response!);
    List<Post> postList = Network.parsePostList(response);


    posts = postList;
    isLoading = false;
    update();
  }

  deletePost(Post post) async {
    update();
    isLoading = true;

    var response = await Network.DEL(
        Network.API_POST_DELETE + post.id.toString(), Network.paramsEmpty());
    LogService.d(response!);
    loadPosts();
  }
  Future callAddPostPage() async {
    bool result = await Get.to(AddPostPage());



    if (result) {
      loadPosts();
    }
  }

  Future callUpdatePage(Post post) async {
    bool result = await Get.to(UpdatePage(post: post));


    if (result) {
      loadPosts();
    }
  }
  Future<void> handleRefresh() async {
    loadPosts();
  }
}

