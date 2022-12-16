import 'package:flutter/material.dart';
import 'package:rest_api/model/post_model.dart';

class DetailsPage extends StatelessWidget {
  final PostModel postModel;
  const DetailsPage({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Details"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurpleAccent,
                child: Text(postModel.id.toString(),style: const TextStyle(fontSize: 50)),
              ),
            ),
            const Divider(),
            Text("ID: ${postModel.id}",style: const TextStyle(fontSize: 30),),
            const SizedBox(height: 10,),
            Text("User ID: ${postModel.userId}",style: const TextStyle(fontSize: 30),),
            const SizedBox(height: 10,),
            Text("Title: ${postModel.title}",style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            Text("Body: ${postModel.body}",style: const TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
