import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';

class Metro extends StatefulWidget {
  const Metro({super.key});

  @override
  State<Metro> createState() => _MetroState();
}

class _MetroState extends State<Metro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiting Room"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: const Text('You'),
                  ),
                  Expanded(child: Padding(padding: EdgeInsets.all(5),)),
                  Icon(Icons.done_all)
                ],
              ),
              tileColor: Color.fromARGB(255, 172, 244, 255)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: const Text('Person1'),
                  ),
                  Expanded(child: Padding(padding: EdgeInsets.all(5),)),
                  Icon(Icons.done)
                ],
              ),
              tileColor: Color.fromARGB(255, 172, 244, 255)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: const Text('--------'),
                  ),
                  Expanded(child: Padding(padding: EdgeInsets.all(5),)),
                  Icon(Icons.punch_clock_rounded)
                ],
              ),
              tileColor: Color.fromARGB(255, 172, 244, 255)
            ),
          ),
          Expanded(child: Padding(padding: EdgeInsets.all(5),)),
          Text("Waiting for three peoples to join "),
          Padding(
          padding: const EdgeInsets.all(30.0),
          child: SwipingButton(text: "Ready To GO", onSwipeCallback:(){},backgroundColor: Colors.blue,swipeButtonColor: Colors.white,iconColor: Colors.blue,),
        )

        ],),
    );
  }
}