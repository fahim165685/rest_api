import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/get_api_controller.dart';
import 'package:rest_api/model/todo_model.dart';

class Todos extends StatelessWidget{
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetApiController getApiController=Get.put(GetApiController());
    return Obx(() {
      if(getApiController.todoList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: getApiController.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            TodoModel todoModel= getApiController.todoList[index];
            return ListTile(
              onTap: (){},
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading:GestureDetector(
                onTap:(){},
                child:(todoModel.completed==true)?CircleAvatar(
                    backgroundColor: Colors.green.withOpacity(0.2),
                    child: const Icon(Icons.task_alt,color: Colors.green,)
                ):CircleAvatar(
                    backgroundColor: Colors.red.withOpacity(0.3),
                    child: const Icon(Icons.dangerous_outlined,color: Colors.red,)
                ),
              ),
              title: Text(todoModel.title.toString(),maxLines: 1,),
              subtitle: Text(todoModel.id.toString()),
            );
          },);
      }
    });
  }
}
