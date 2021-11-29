import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/data_controller.dart';

class ItemDialog extends StatefulWidget {
  final DataController controller;
  const ItemDialog({Key? key, required this.controller}) : super(key: key);

  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<ItemDialog> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Añadir Elemento'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Texto',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      String text = _textEditingController.text;
                      if (text.isNotEmpty) {
                        widget.controller.addItem = text;
                        Get.back();
                      }
                    },
                    child: const Text('Añadir'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
