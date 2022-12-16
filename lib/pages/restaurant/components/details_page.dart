import 'package:flutter/material.dart';
import 'package:rest_api/model/restaurant_model.dart';

class DetailsPage extends StatelessWidget {
  Orderinfo orderInfo;
  DetailsPage({super.key, required this.orderInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OderInfo:",
              style: TextStyle(fontSize: 30),
            ),
            buildRichText(key: "Title", value: orderInfo.title.toString()),
            buildRichText(key: "tokenNo", value: orderInfo.tokenNo.toString()),
            buildRichText(
                key: "OrderTime", value: orderInfo.ordertime.toString()),
            buildRichText(
                key: "OrderDate", value: orderInfo.orderdate.toString()),
            buildRichText(key: "OrderId", value: orderInfo.orderId.toString()),
            buildRichText(
                key: "CustomerName", value: orderInfo.customerName.toString()),
            buildRichText(
                key: "customerPhone",
                value: orderInfo.customerPhone.toString()),
            buildRichText(key: "Waiter", value: orderInfo.waiter.toString()),
            buildRichText(key: "TabLeno", value: orderInfo.tableno.toString()),
            buildRichText(
                key: "tableName", value: orderInfo.tableName.toString()),
            Divider(),
            const Text(
              "KitchenInfo:",
              style: TextStyle(fontSize: 30),
            ),
            buildRichText(
                key: "kitchenName",
                value: orderInfo.kitcheninfo![0].kitchenName.toString()),
            buildRichText(
                key: "IP",
                value: orderInfo.kitcheninfo![0].ip!.isEmpty
                    ? "Now IP Fond"
                    : orderInfo.kitcheninfo![0].ip.toString()),
            buildRichText(
                key: "Port",
                value: orderInfo.kitcheninfo![0].port!.isEmpty
                    ? "Now Port Fond"
                    : orderInfo.kitcheninfo![0].port.toString()),
            Divider(),
            const Text(
              "ItemInfo:",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: (){
              print(orderInfo.kitcheninfo![0].iteminfo!.length);
            }, child: Text("fd")),

          ],
        ),
      ),
    );
  }

  Widget buildRichText({
    required String key,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
          text: TextSpan(
              text: '$key: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              children: [
            TextSpan(
                text: value,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w400))
          ])),
    );
  }
}
