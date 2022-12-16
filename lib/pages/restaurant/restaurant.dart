import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/restataurant_api_controller.dart';
import 'package:rest_api/model/restaurant_model.dart';
import 'package:rest_api/pages/restaurant/components/details_page.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResApiController resApiController = Get.put(ResApiController());
    return Obx(() {
      if (resApiController.resList.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: resApiController.resList.length,
          itemBuilder: (BuildContext context, int index) {
            Orderinfo orderInfo = resApiController.resList[index];
            return ListTile(
              onTap: () {
                Get.to(
                    ()=>DetailsPage(
                      orderInfo: orderInfo,
                    ),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.downToUp,
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: CircleAvatar(
                backgroundColor: Colors.red.withOpacity(0.3),
                child: Text(orderInfo.orderId.toString(),
                    style: const TextStyle(color: Colors.black)),
              ),
              title: Text(
                orderInfo.title.toString(),
                maxLines: 1,
              ),
              subtitle: Text(orderInfo.orderdate.toString()),
            );
          },
        );
      }
    });
  }
}
