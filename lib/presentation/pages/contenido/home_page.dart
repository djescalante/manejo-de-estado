import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/auth_controller.dart';
import 'package:misiontic_template/domain/use_case/controllers/data_controller.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/presentation/pages/contenido/screens/home_screen.dart';
import 'package:misiontic_template/presentation/pages/contenido/screens/widgets/item_dialog.dart';
import 'package:misiontic_template/presentation/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  final ThemeController _themeController = Get.find();
  //final AuthController _authController = Get.find();
  final DataController _dataController = Get.find();
  //HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(
      //   controller: _themeController,
      //   context: context,
      //  tile: Text("!Hola ${_authController.name}")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: HomeScreen(controller: _dataController),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.dialog(ItemDialog(controller: _dataController));
        },
      ),
    );
  }
}
