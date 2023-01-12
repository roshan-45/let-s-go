import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsgo/extraSeat.dart';
import 'package:letsgo/updateprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  
  State<Profile> createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {

  final user = FirebaseAuth.instance.currentUser;

  String? name;
  String? usn;
  String? email;
  String? address;
  String? image;
  String? vehicle;
  String? number;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Details(BuildContext context)async {
      await firestore.collection('users').where('email',isEqualTo: user?.email).get().then((value) {
        //print(user?.email);
        List l = [];
        //print(value.docs);
                value.docs.forEach((element) {
                  l.add(element.data());
                  print(element.data);
                });
                print(l);
                usn = l[0]['usn'];
                print(usn);
                name = l[0]['Name'];
                email = l[0]['email'];
                address = l[0]['address'];
                image = l[0]['image'];
                vehicle = l[0]['vehicle'];
                number = l[0]['number'];
                //print(image);
              });
   }
  
  
  @override
  Widget build(BuildContext context) {
    Details(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    //backgroundImage: NetworkImage(image!),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  ListTile(
                    title: Text("Name   :"),
                    trailing: Text("${name}"),
                  ),
                  ListTile(
                    title: Text("USN   :"),
                    trailing: Text("${usn}"),
                  ),
                  ListTile(
                    title: Text("Number   :"),
                    trailing: Text("${number}"),
                  ),
                  ListTile(
                    title: Text("Address   :"),
                    trailing: Text("${address}"),
                  ),
                  ListTile(
                    title: Text("Email   :"),
                    trailing: Text("${usn}"),
                  ),
                  ListTile(
                    title: Text("Vehicles   :"),
                    trailing: Expanded(child: Text("${vehicle}")),
                  ),
                  SizedBox(
                  height: 30,
                ),
                // ElevatedButton(onPressed: (){
                //   Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) =>Update(name,usn,address,vehicle,number),
                //             ),
                //           );
                // }, child: Text("Update my Profile"))
                ]),
                
          ),
        ),
      ),
    );
  }
}
