// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  //Cuando usea el Auth tengo que mandar un Widget como argumento
  
  final Widget child;

  const AuthBackground({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // (infinity) para que cuando yo importe el Auth, sea igual al tamaño de todo el dispositivo
    // ignore: sized_box_for_whitespace
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [

          _PurpleBox(), 
        
          _HeaderIcon(),

        
           child,
      

      ], 
      ) ,
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //Para que el Widget solo me cubra el 40% 

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      //Stack para colocar un Widget encima de otro
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, right: -20),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 20),


        ],
      ),
    );
  }
  // método que me regresa el BoxDecoration
  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient(
    colors: [
      Color.fromRGBO(12, 183, 242, 9),
      Color.fromRGBO(12, 183, 242, 9)

        ]
      )
    );
  }

// Como es un widget que voy a tener que colocar por todos lados, lo creo a parte, es el widget de los circulos en el fondo
class _Bubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255,255,255,0.05)
      ),
    );
  }
}