import 'package:flutter/material.dart';
import 'package:rest_api/model/user_model.dart';

class DetailsPage extends StatelessWidget {
  final UserModel userModel;
  const DetailsPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Details"),),
      body: ListView(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurpleAccent,
              child: Text(userModel.id.toString(),style: const TextStyle(fontSize: 50)),
            ),
          ),
          const Divider(),
          Text("ID: ${userModel.id}",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Text("Name: ${userModel.name}",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Text("User name: ${userModel.username}",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Text("Emile: ${userModel.email}",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Text("Phone: ${userModel.phone}",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Text("WebSite: ${userModel.website}",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),
          Text("Emile: ${userModel.email}",style: const TextStyle(fontSize: 25),),
          const Divider(),
          const SizedBox(height: 5,),
          const Text("Address:-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text("Street: ${userModel.address!.street}",style: const TextStyle(fontSize: 25),),
          Text("Suite: ${userModel.address!.suite}",style: const TextStyle(fontSize: 25),),
          Text("City: ${userModel.address!.city}",style: const TextStyle(fontSize: 25),),
          Text("Zeep Code: ${userModel.address!.zipcode}",style: const TextStyle(fontSize: 25),),

          const Divider(),
          const SizedBox(height: 5,),
          const Text("Geo:-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text("Let: ${userModel.address!.geo!.lat}",style: const TextStyle(fontSize: 25),),
          Text("Lng: ${userModel.address!.geo!.lng}",style: const TextStyle(fontSize: 25),),

          const Divider(),
          const SizedBox(height: 5,),
          const Text("company:-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text("Company Name: ${userModel.company!.name}",style: const TextStyle(fontSize: 20),),
          Text("Catch Phrase: ${userModel.company!.catchPhrase}",style: const TextStyle(fontSize: 20),),
          Text("Bs: ${userModel.company!.bs}",style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 1,),
        ],
      ),
    );
  }
}
