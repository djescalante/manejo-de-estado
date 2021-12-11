//como ya tenemos un manejador que nos actualiza las vistas cuando hay cambio
// no necesitamos que el widget tenga estado ya lo hace el controlador

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/data_controller.dart';

class HomeScreen extends StatelessWidget {
  final DataController controller;

  HomeScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => ListView.separated(
          itemBuilder: (context, index) {
            String item = controller.data[index];
            return Dismissible(
              key: ValueKey('Item$index'),
              child: ListTile(
                title: Text(item),
                onTap: () {
                  controller.select = index;
                  Get.toNamed('/details');
                },
              ),
              //cuando deslicemos hacia cualquier lado va a borrar el elemento
              onDismissed: (direction) {
                controller.deleteItem(index);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: controller.data.length)),
    );
  }
}
