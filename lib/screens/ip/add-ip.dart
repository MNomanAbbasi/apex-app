import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/program/addprogram.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addIP extends StatelessWidget {
  List<UserProgram> users;
  addIP({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD IP"),
      ),
      body: MyCustomForm(
        users: users,
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  List<UserProgram> users;
  List<UserProgram> getUsers() {
    return users;
  }

  MyCustomForm({
    Key? key,
    required this.users,
  }) : super(key: key);

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
                hintText: 'Program',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              controller: lastnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'client',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'color',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              controller: clientController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title  ',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("students")
                      .doc()
                      .set({
                    "Program": Controller.text,
                    "Client": lastnameController.text,
                    "Color": usernameController.text,
                    "Title": clientController.text,
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
