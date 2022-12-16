import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/get_api_controller.dart';
import 'package:rest_api/model/image_model.dart';
import 'package:rest_api/pages/photos/components/details_page.dart';
class Photos extends StatelessWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetApiController getApiController=Get.put(GetApiController());
    return Obx(() {
      if(getApiController.photosList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: getApiController.albumList.length,
          itemBuilder: (BuildContext context, int index) {
            ImageModel photosModel= getApiController.photosList[index];
            return ListTile(
              onTap: (){
               Get.to(()=> DetailsPage(
                 photoModel: photosModel,
               ),transition: Transition.circularReveal,duration: const Duration(milliseconds: 500));
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: CircleAvatar(
                backgroundColor: Colors.red.withOpacity(0.3),
                backgroundImage: NetworkImage(photosModel.url.toString()),
              ),
              title: Text(photosModel.title.toString(),maxLines: 1,),
              subtitle: FittedBox(
                child: Text(photosModel.url
                    .toString()),
              ),
            );
          },);
      }
    });
  }
}
