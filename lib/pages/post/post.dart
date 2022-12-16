import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/get_api_controller.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/pages/post/components/details_page.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GetApiController getApiController=Get.put(GetApiController());
    return Obx((){
      if(getApiController.postList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: getApiController.postList.length,
          itemBuilder: (BuildContext context, int index) {
            PostModel postModel= getApiController.postList[index];
          return ListTile(
            onTap: (){
              Get.to(()=>DetailsPage(
                postModel: postModel,
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            leading: CircleAvatar(
              backgroundColor: Colors.red.withOpacity(0.3),
              child: Text(postModel.id.toString(),style: const TextStyle(color: Colors.black)),
            ),
            title: Text(postModel.title.toString(),maxLines: 1,),
            subtitle: Text(postModel.userId.toString()),
          );
        },);
      }
    } );
  }
}
