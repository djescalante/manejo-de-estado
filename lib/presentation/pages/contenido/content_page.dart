import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/auth_controller.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/presentation/pages/contenido/chat.dart';
import 'package:misiontic_template/presentation/pages/contenido/home_page.dart';
import 'package:misiontic_template/presentation/pages/contenido/profile_page.dart';
import 'package:misiontic_template/presentation/widgets/appbar.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//lista de widgets
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    final AuthController _authController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
          controller: _themeController,
          context: context,
          tile: Text("!Hola ${_authController.name}")),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.blue),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.blue),
            label: 'GPS',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[600],
      ),
    );
  }
}
