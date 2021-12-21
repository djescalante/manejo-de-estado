import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UbicacionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LatLng latLng = LatLng(4.7110, -74.0721);
    CameraPosition cameraPosition = CameraPosition(target: latLng);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            TopPage(),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: cameraPosition,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,
        height: 200,
        color: Colors.black,
        child: Column(children: [
          Icon(Icons.map, size: 120, color: Colors.white),
          Align(
              child: Text("mi ubicación",
                  style: TextStyle(color: Colors.white, fontSize: 25)))
        ]));
  }
}
