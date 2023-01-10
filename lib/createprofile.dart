import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'firstpage.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Create());
  }
}

class Create extends StatefulWidget{
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController name = TextEditingController();

  TextEditingController usn = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController vehicle = TextEditingController();

  String? error="";

  final user = FirebaseAuth.instance.currentUser;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create your profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name*',
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: usn,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter usn*',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: address,
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter address*',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: vehicle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter vehicle name(if exists)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width-50,
                child: ElevatedButton(
                  onPressed: ()
              async {
                print(name.text);
            if (name.text == "" || usn.text == "" || address.text == "") {
              setState(() {
                error = 'Fill all the Required fields';
              });
            }  else {
              await firestore.collection('users').add({
                'user': user?.email,
                'Name': name.text,
                'usn': usn.text,
                'address': address.text,
                'vehiclename': vehicle.text,
              }).then((name) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Created Successfully')));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => First(),
                  ),
                );
              }).catchError((err) {
                setState(() {
                  error = err;
                });
              });
            }
          
                }, child: const Text("CREATE"))),
                
            ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        error!,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
