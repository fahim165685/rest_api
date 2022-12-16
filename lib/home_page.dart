import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/pages/albums/albums.dart';
import 'package:rest_api/pages/comments/comments.dart';
import 'package:rest_api/pages/login/login.dart';
import 'package:rest_api/pages/photos/photos.dart';
import 'package:rest_api/pages/registration/registration.dart';
import 'package:rest_api/pages/todos/todos.dart';
import 'package:rest_api/pages/users/users.dart';

import 'pages/post/post.dart';
import 'pages/restaurant/restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> page = [
    const Post(),
    const Comments(),
    const Albums(),
    const Photos(),
    const Todos(),
    const Users(),
    const Restaurant(),
    const Login(),
    const Registration(),
  ];
//registration
  List listViewItem = [
    [Icons.post_add, "Post",],
    [Icons.comment, "Comments"],
    [Icons.album, "Albums"],
    [Icons.photo_album, "Photos",],
    [Icons.note, "Todos",],
    [Icons.supervised_user_circle_outlined, "Users",],
    [Icons.restaurant, "Restaurant",],
    [Icons.login, "Login",],
    [Icons.app_registration, "Registration",],
  ];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        title: Text(listViewItem[selectedItem][1],
            style: TextStyle(color: Colors.black.withOpacity(0.5))),
        centerTitle: true,
      ),
      body:Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: ListView(
                  children: [
                    ...List.generate(
                        listViewItem.length,
                            (index) => ListTile(
                          onTap: () {
                            setState(() {
                              selectedItem = index;
                            });
                          },
                          contentPadding:const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                          title: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              listViewItem[index][0],
                              color: selectedItem == index
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                          subtitle: (selectedItem==index)?Text(
                            listViewItem[index][1],
                            style: TextStyle(
                              color: selectedItem == index
                                  ? Colors.red
                                  : Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ):null,
                        )),
                    const Divider(
                      color: Colors.black,
                    ),
                    Text("Post Api"),

                  ],
                ),
              )),
          Expanded(
            flex: 6,
            child: page[selectedItem],
          )
        ],
      ),
    );
  }
}
