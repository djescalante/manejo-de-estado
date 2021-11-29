import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/data_controller.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/presentation/pages/detalles/screens/details_screen.dart';
import 'package:misiontic_template/presentation/widgets/appbar.dart';

class DetailsPage extends StatelessWidget {
  final ThemeController _themeController = Get.find();
  final DataController _dataController = Get.find();
  DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          controller: _themeController,
          context: context,
          tile: const Text("Detalles")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: DetailsScreen(controller: _dataController),
        ),
      ),
    );
  }
}
