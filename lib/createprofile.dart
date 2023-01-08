import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Create());
  }
}

class Create extends StatelessWidget{
  const Create({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create your profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter usn',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: const TextField(
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter address',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: const TextField(
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
              child: ElevatedButton(onPressed: (){}, child: const Text("CREATE"))),
          )
        ],
      ),
    );
  }
}
