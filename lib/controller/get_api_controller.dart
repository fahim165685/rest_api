import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/model/album_model.dart';
import 'package:rest_api/model/comment_model.dart';
import 'package:rest_api/model/image_model.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/model/todo_model.dart';
import 'package:rest_api/model/user_model.dart';
import 'package:rest_api/repository/get_test_api_repo.dart';

class GetApiController extends GetxController{
  final postList =[].obs;
  final commentList =[].obs;
  final albumList =[].obs;
  final photosList =[].obs;
  final todoList =[].obs;
  final userList =[].obs;

  @override
  void onInit() {
    super.onInit();
    postController();
    commentsController();
    albumController();
    photoController();
    todoController();
    userController();

  }
  //postController
  postController() async{
    var response = await GetTestApiRepo().getPortRepo();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);
      print(resBody);

      for(var data in resBody ){
        postList.add(PostModel.fromJson(data));
      }
    }
      print(">>>>>>>>>>>>>>GetApiController.postController${ response.statusCode}");
  }

  commentsController() async{
    var response = await GetTestApiRepo().getCommentsAPi();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);

      for(var data in resBody ){
        commentList.add(CommentModel.fromJson(data));
      }
    }else{
      print(">>>>>>>>>>>>>>GetApiController.commentsController${ response.statusCode}");
    }
  }

  albumController() async{
    var response = await GetTestApiRepo().getAlbumApi();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);

      for(var data in resBody ){
        albumList.add(AlbumModel.fromJson(data));
      }
    }else{
      print(">>>>>>>>>>>>>>GetApiController.albumController${ response.statusCode}");
    }
  }


  photoController() async{
    var response = await GetTestApiRepo().getPhotoApi();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);

      for(var data in resBody ){
        photosList.add(ImageModel.fromJson(data));
      }
    }else{
      print(">>>>>>>>>>>>>>GetApiController.photoController${ response.statusCode}");
    }
  }

  todoController() async{
    var response = await GetTestApiRepo().getTodoListApi();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);

      for(var data in resBody ){
        todoList.add(TodoModel.fromJson(data));
      }
    }else{
      print(">>>>>>>>>>>>>>GetApiController.todoController${ response.statusCode}");
    }
  }


 userController() async{
    var response = await GetTestApiRepo().getUsersApi();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);

      for(var data in resBody ){
        userList.add(UserModel.fromJson(data));
      }
    }else{
      print(">>>>>>>>>>>>>>GetApiController.todoController${ response.statusCode}");
    }
  }


}
