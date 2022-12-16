import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/get_api_controller.dart';
import 'package:rest_api/model/user_model.dart';
import 'package:rest_api/pages/users/components/details_page.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetApiController getApiController=Get.put(GetApiController());
    return Obx(() {
      if(getApiController.albumList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: getApiController.userList.length,
          itemBuilder: (BuildContext context, int index) {
            UserModel userModel= getApiController.userList[index];
            return ListTile(
              onTap: (){
                Get.to(()=>DetailsPage(
                  userModel: userModel,
                ));
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: CircleAvatar(
                backgroundColor: Colors.red.withOpacity(0.3),
                child: Text(userModel.id.toString(),style: const TextStyle(color: Colors.black)),
              ),
              title: Text(userModel.name.toString(),maxLines: 1,),
              subtitle: Text(userModel.email
                  .toString()),
            );
          },);
      }
    });
  }
}
