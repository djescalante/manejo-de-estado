import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/auth_controller.dart';
import 'package:misiontic_template/domain/use_case/controllers/data_controller.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/domain/use_case/theme_management.dart';
import 'package:misiontic_template/presentation/pages/authentication/auth_page.dart';
import 'package:misiontic_template/presentation/pages/contenido/content_page.dart';
import 'package:misiontic_template/presentation/pages/detalles/details_page.dart';
import 'package:misiontic_template/presentation/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Dependency injection: setting up state management
  // mantiene en memoriael  el tema seleccionado
  //inyeccion de dependencia es añadir un controlador y despues poder obtenerlo
  // aqui lo obtenemos con el Get.put
  late final ThemeController controller = Get.put(ThemeController());
  // Theme management
  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;

  Future<void> initializeTheme() async {
    controller.darkMode = await manager.storedTheme;
    setState(() => isLoaded = true);
  }

  @override
  void initState() {
    Get.put(DataController()); // inyeccion del controlador DataController
    Get.put(AuthController()); // inyeccion del controlador AuthControloller
    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    initializeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const CircularProgressIndicator()
        : GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.ligthTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: AutPage(),
            routes: {
                '/auth': (context) => AutPage(),
                '/content': (context) => ContentPage(),
                '/details': (context) => DetailsPage(),
              });
  }
}
