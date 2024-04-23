
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ngdemo13/controllers/addpost_contiroller.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final _controller = Get.find<AddPostController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Add Post"),
        ),
        body: GetBuilder<AddPostController>(
          builder:(controller){
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: _controller.titleController,
                      decoration: InputDecoration(
                          hintText: "Title"
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: _controller.bodyController,
                      decoration: InputDecoration(
                          hintText: "Body"
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          _controller.addPost();
                        },
                        child: Text("Add"),
                      )
                  ),
                ],
              ),
            );
          } ,
        )
      ),
    );
  }
}
