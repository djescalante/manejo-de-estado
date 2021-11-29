//00 esta es unas de las pantallas de aut_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/auth_controller.dart';

//01 como el login va a tener un texto necesitamos que tenga un widget con estado
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  //vinculamos el metodo estado
  @override
  _LoginState createState() => _LoginState();
}

//01 esto es el estado y es una clase privada _
class _LoginState extends State<LoginScreen> {
  //02 como ya creamos el widget ahora hay que crear la interfaz es decir
  //el layout con los elementos de la pantalla de inicio
  //lo primero que necesitamos es un texto entonces nos hace falta un controlador de text
  //03 controlador de texto - con esto creamos la variable para el texo
  late TextEditingController _textController;
  late String _inputText;
  late AuthController _authController;
  //04 como las variables son de inicio tardio las inicializamos
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _authController = Get.find(); //busca el controlador que inyecté en app.dart
    // a los input text los vamos a inicializar conel controla dor de la pantalla
  }

  //01 creamos el  o los metodos
  @override
  Widget build(BuildContext context) {
    //05 con las variables creadas para el campo de texto, creamos la interfaz
    //un build siempre lleva un return
    //como vamos a crear un campo de texto y un boton los vamos a centrar.
    return Center(
      child: Column(
        // que se extienda a lo ancho de la columna
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //el tamaño principal sea el minimo
        mainAxisSize: MainAxisSize.min,
        //y ahora creamos los hijos los dos campos texto y boton
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(labelText: 'Ingresa tu nombre:'
                //lo podemos usar asi y sacar el texto del controlador
                ),
            //tambien podemos usar el metodo onchange paraque cada vez que se esciba
            // se actualice el inputText y se ejecute y nos muestre por consola

            onChanged: (String text) {
              //cada vez q cambia el texto actualizo la variable _inputText
              print(text);
              _inputText = text;
            },
          ),
          //06 ahora generamos el boton que ejecute el cambio de estado y nos pase
          //a la paginade contenido
          ElevatedButton(
              onPressed: () {
                //validamos que hayan escrito el nombre.
                // si hay un nombre ya me puedo mover a la otra pantalla.
                if (_inputText.isNotEmpty) {
                  _authController.username = _textController.text;
                }
              },
              child: const Text('Iniciar Sesion'))
        ],
      ),
    );
  }
}
