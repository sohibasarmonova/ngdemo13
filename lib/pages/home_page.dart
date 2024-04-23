import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:ngdemo13/pages/add_post_page.dart';
import 'package:ngdemo13/pages/update_page.dart';

import '../controllers/home_controller.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.find<HomeController>();



    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _controller.loadPosts();
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Networking"),
      ),
      body:GetBuilder<HomeController>(
        builder: (controller){
         return  Stack(
           children: [
             RefreshIndicator(
               onRefresh: _controller.handleRefresh,
               child: ListView.builder(
                 itemCount:_controller. posts.length,
                 itemBuilder: (ctx, index) {
                   return _itemOfPost(_controller.posts[index]);
                 },
               ),
             ),
             _controller. isLoading
                 ? Center(
               child: CircularProgressIndicator(),
             )
                 : SizedBox.shrink(),
           ],
         );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _controller.callAddPostPage();
        },
      ),
    );
  }

  Widget _itemOfPost(Post post) {
    return Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                _controller.callUpdatePage(post);
              },
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                _controller.deletePost(post);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(post.body!,
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              Divider(),
            ],
          ),
        ));
  }
}




