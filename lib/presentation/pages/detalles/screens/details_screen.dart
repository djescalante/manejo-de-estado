import 'package:flutter/widgets.dart';
import 'package:misiontic_template/domain/use_case/controllers/data_controller.dart';

class DetailsScreen extends StatelessWidget {
  final DataController controller;
  const DetailsScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(controller.selected),
    );
  }
}
