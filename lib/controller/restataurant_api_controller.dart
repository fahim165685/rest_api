import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/model/restaurant_model.dart';
import 'package:rest_api/repository/restaurant_api_repo.dart';

class ResApiController extends GetxController {
  final resList=[].obs;


  @override
  void onInit() {
    super.onInit();
    postController();
  }

  postController() async{
    var response = await RestaurantApiRepo().getRestaurantApi();
    if (response.statusCode==200){
      var resBody= jsonDecode(response.body);
      print("object");
      print(resBody);
      for(var data in resBody['data']['orderinfo']){
        resList.add(Orderinfo.fromJson(data));
      }
    }
    print(resList.length);
    print(">>>>>>>>>>>>>>GetApiController.postController${ response.statusCode}");
  }
}