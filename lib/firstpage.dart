import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:letsgo/metrowait.dart';
import 'package:letsgo/ride.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
          ),
          SizedBox(
            height: 235,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListTile(
                    title: Center(child: Text("Have an extra seat")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ride(),
                        ),
                      );
                    },
                    tileColor: Color.fromARGB(255, 172, 244, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), //<-- SEE HERE
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListTile(
                    title: Center(child: Text("Need a ride")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ride(),
                        ),
                      );
                    },
                    tileColor: Color.fromARGB(255, 172, 244, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), //<-- SEE HERE
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(13,13,13,0),
                  child: ListTile(
                    title: Center(child: Text("Go to metro by auto")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Metro(),
                        ),
                      );
                    },
                    tileColor: Color.fromARGB(255, 172, 244, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), //<-- SEE HERE
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
