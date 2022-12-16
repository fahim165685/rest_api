import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/get_api_controller.dart';
import 'package:rest_api/model/album_model.dart';

class Albums extends StatelessWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetApiController getApiController=Get.put(GetApiController());
    return Obx(() {
      if(getApiController.albumList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: getApiController.albumList.length,
          itemBuilder: (BuildContext context, int index) {
            AlbumModel albumModel= getApiController.albumList[index];
            return ListTile(
              onTap: (){},
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: CircleAvatar(
                backgroundColor: Colors.red.withOpacity(0.3),
                child: Text(albumModel.id.toString(),style: const TextStyle(color: Colors.black)),
              ),
              title: Text(albumModel.title.toString(),maxLines: 1,),
              subtitle: Text(albumModel.userId
                  .toString()),
            );
          },);
      }
    });
  }
}
