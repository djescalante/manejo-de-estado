import 'package:get/get.dart';

//Este controlador lo vamos a inyectar en app.dart
class DataController extends GetxController {
  //este sera el controlador para  la lista  de textos
  // final pq la variable no cambia, lo que cambia es el valor dentro de ella
  //Gerenaramos una variable con una lista de texto reactiva
  final _data = Rx<List<String>>([]);
  // la Variable que vamos a utilizar para pa ver los detalles
  final _selected = RxString('');

  // ya tenemos las variables ahora falta modificarlos y leerlos

  // añadir elemento y selecccionar elemento

  set addItem(String item) {
    _data.value.add(item);
    _data.refresh();
  }

  set select(int index) {
    _selected.value = _data.value[index];
  }

  deleteItem(int index) {
    _data.value.removeAt(index);
    _data.refresh();
  }

  //leer los datos para poder mostrarlos

  //lista Reactiva
  Rx<List<String>> get reactiveData => _data;
  //lista no reactiva
  List<String> get data => _data.value;

  //lista Reactiva
  RxString get reactiveSelected => _selected;
  //lista no reactiva

  String get selected => _selected.value;
}
