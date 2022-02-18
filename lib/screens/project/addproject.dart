import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/program/addprogram.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addproject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD ProJect"),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var Controller = TextEditingController();
    var lastnameController = TextEditingController();
    var clientController = TextEditingController();
    // ignore: unused_local_variable
    var projectController = TextEditingController();
    // ignore: unused_local_variable
    var typeController = TextEditingController();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Client',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              controller: lastnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'PROJECT NAME',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("Project")
                      .doc()
                      .set({
                    "client": Controller.text,
                    "name": lastnameController.text,
                  });

                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text("done"),
                      );
                    },
                  );
                },
                child: const Text("submit")),
          ),
        ],
      ),
    );
  }
}
