import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/get_api_controller.dart';
import 'package:rest_api/model/comment_model.dart';
class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetApiController getApiController=Get.put(GetApiController());
    return Obx(() {
      if(getApiController.commentList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: getApiController.commentList.length,
          itemBuilder: (BuildContext context, int index) {
            CommentModel commentModel= getApiController.commentList[index];
            return ListTile(
              onTap: (){},
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: CircleAvatar(
                backgroundColor: Colors.red.withOpacity(0.3),
                child: Text(commentModel.id.toString(),style: const TextStyle(color: Colors.black)),
              ),
              title: Text(commentModel.name.toString(),maxLines: 1,),
              subtitle: Text(commentModel.email
                  .toString()),
            );
          },);
      }
    });
  }
}
