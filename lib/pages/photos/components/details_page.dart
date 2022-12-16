import 'package:flutter/material.dart';
import 'package:rest_api/model/image_model.dart';

class DetailsPage extends StatelessWidget {
  ImageModel photoModel;
  DetailsPage({super.key, required this.photoModel});

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
              "Images:",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildImages(image: photoModel.url.toString(), number: "1"),
                buildImages(
                    image: photoModel.thumbnailUrl.toString(), number: "2"),
              ],
            ),
            buildRichText(
              key: "Album ID",
              value: photoModel.albumId.toString()
            ),
            buildRichText(
                key: "ID",
                value: photoModel.id.toString()
            ),
            buildRichText(
                key: "Title",
                value: photoModel.title.toString()
            ),
            buildRichText(
                key: "url",
                value: photoModel.url.toString()
            ),
            buildRichText(
                key: "url",
                value: photoModel.thumbnailUrl.toString()
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RichText(
                 text:TextSpan(
                    text: '$key: ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: value,
                      style: TextStyle(
                          fontSize: 20, color: Colors.black.withOpacity(0.5),fontWeight: FontWeight.w400))
                ])),
    );
  }

  CircleAvatar buildImages({required String image, required String number}) {
    return CircleAvatar(
      backgroundImage: NetworkImage(image),
      radius: 60,
      child: Stack(
        children: [
          Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(number,
                    style: const TextStyle(color: Colors.black, fontSize: 25)),
              ))
        ],
      ),
    );
  }
}
