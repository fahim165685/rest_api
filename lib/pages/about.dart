//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;
// import 'package:rest_api/model/restaurant_model.dart';
// import 'package:rest_api/pages/rs_detals.dart';
//
// class About extends StatefulWidget {
//   const About({Key? key}) : super(key: key);
//
//   @override
//   State<About> createState() => _AboutState();
// }
//
// class _AboutState extends State<About> {
//
//   Future<List<Orderinfo>>rsGetApi()async{
//     List<Orderinfo> orderInfo = [];
//     Uri url=Uri.parse('https://restaurant.bdtask.com/demo/app/printtoken');
//     var response =await https.get(url);
//     print("<<<<<<StatusCode RsModel>>>>>>${response.statusCode}");
//     var rseBody =jsonDecode(response.body);
//    print("Check${rseBody['data']['orderinfo'][0]['kitcheninfo'][0]['kitchenName']}");
//     //print("end");
//
//     for (var data in rseBody['data']['orderinfo']){
//       orderInfo.add(
//         Orderinfo(
//           title: data['title'],
//           tokenNo: data['token_no'],
//           ordertime:  data['ordertime'] ,
//           orderdate: data['orderdate'] ,
//           orderId: data['order_id'] ,
//           customerName: data['customerName'] ,
//           customerPhone: data['customerPhone'] ,
//           waiter: data['waiter'] ,
//          tableno:  data['tableno'] ,
//           tableName: data['tableName'],
//           kitcheninfo:[
//             Kitcheninfo(
//               ip: data['ip'],
//               kitchenName: data['kitchenName'],
//               isitemexist: data['isitemexist'],
//               port: data['port'],
//
//             )
//           ]
//         ),
//       );
//     }
//     print(orderInfo.length);
//     if(response.statusCode == 200){
//      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("code${response.statusCode}\nI got the information.  ")));
//     }
//     return orderInfo;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: rsGetApi(),
//         builder: (BuildContext context,AsyncSnapshot snapshot) {
//         if(snapshot.hasError){
//           return Text("Error: ${snapshot.error.toString()}");
//         }
//         else if(snapshot.hasData){
//           print("hasData: ${snapshot.hasData}");
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//               itemBuilder:(context, index) {
//                Orderinfo orderInfo=snapshot.data[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text(orderInfo.orderId.toString()),
//                   ),
//                   title: Text(orderInfo.title.toString()),
//                   subtitle: Text(orderInfo.waiter.toString()),
//                   onTap: (){
//                     Navigator.push(context,MaterialPageRoute(builder: (context) => RsDetails(orderInfo: orderInfo),));
//                   },
//
//                 );
//               }, );
//         }
//         return const Center(child: CircularProgressIndicator());
//         }
//         ,);
//   }
// }
