// 07 pagina de autenticacion que va a tener varias pantallas
// este widget no va a tener ningun cambio de estado es el padre de auth_page
// solo estamos construyendo lo que se ve sin ninguna logica
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/presentation/pages/authentication/screens/login_screen.dart';
import 'package:misiontic_template/presentation/widgets/appbar.dart';

class AutPage extends StatelessWidget {
  final ThemeController _themeController = Get.find();
  //AuthPage era constante pero como estamos declarando una variable fuera del constructor ya no lo es
  AutPage({Key? key}) : super(key: key);
  //esta es nuestra barra de titulo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        //aquí va el controlador del tema, pero este ya viene prediseñado en la plantilla que nos dieron
        //app.dart ThemeController
        controller: _themeController,
        tile: const Text('Autenticación'),
        context: context,
      ),
      //ahora creamos el cuerpo
      //con un safe area para que se pinte en un area donde no lo tapen otros botones
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          //llamamos a nuestro loginScreen
          child: LoginScreen(),
        ),
      ),
    );
  }
}
