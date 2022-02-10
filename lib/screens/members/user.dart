// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String username;
  String clientprovince;
  String project;
  String type;
  String status;
  User(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.clientprovince,
      required this.project,
      required this.type,
      required this.status});

  static List<User> getUsers() {
    return <User>[
      User(
          firstName: "Aaryan",
          lastName: "Shah",
          username: "hello",
          clientprovince: "UNICEF ALL",
          project: "ALL",
          type: "PME offer",
          status: "active"),
      User(
          firstName: "baryan",
          lastName: "Shah",
          username: "hello",
          clientprovince: "UNICEF ALL",
          project: "ALL",
          type: "PME offer",
          status: "active"),
      User(
          firstName: "caryan",
          lastName: "Shah",
          username: "hello",
          clientprovince: "UNICEF ALL",
          project: "ALL",
          type: "PME offer",
          status: "active"),
      User(
          firstName: "daryan",
          lastName: "Shah",
          username: "hello",
          clientprovince: "UNICEF ALL",
          project: "ALL",
          type: "PME offer",
          status: "active"),
      User(
          firstName: "earyan",
          lastName: "Shah",
          username: "hello",
          clientprovince: "UNICEF ALL",
          project: "ALL",
          type: "PME offer",
          status: "active"),
    ];
  }
}

List<User> gusers = User.getUsers();

class adduser extends StatelessWidget {
  List<User> users;
  adduser({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add member"),
      ),
      body: MyCustomForm(
        users: users,
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  List<User> users;
  List<User> getUsers() {
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
    var projectController = TextEditingController();
    var typeController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: Controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'First Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: lastnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Last name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'username  ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: clientController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'client province  ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: projectController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'project  ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: typeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'type  ',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'status  ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
          child: ElevatedButton(
              onPressed: () {
                gusers.add(User(
                    firstName: Controller.text,
                    lastName: lastnameController.text,
                    username: usernameController.text,
                    clientprovince: clientController.text,
                    project: projectController.text,
                    type: Controller.text,
                    status: "active"));

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
    );
  }
}
