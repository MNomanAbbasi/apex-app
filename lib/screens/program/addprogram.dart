// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class UserProgram {
  String program;
  String client;

  String color;
  String icon;

  UserProgram({
    required this.program,
    required this.client,
    required this.color,
    required this.icon,
  });

  static List<UserProgram> getUserPrograms() {
    return <UserProgram>[
      UserProgram(
        program: "WASH",
        client: "UNICEF",
        color: "BLUE",
        icon: "wash",
      ),
      UserProgram(
        program: "HEALTH",
        client: "UNICEF",
        color: "Light Green",
        icon: "health",
      ),
      UserProgram(
        program: "EDUCATION",
        client: "UNICEF",
        color: "GREEN",
        icon: "education",
      ),
      UserProgram(
        program: "EDUCATION",
        client: "WORLD BANK",
        color: "dark blue",
        icon: "education",
      ),
      UserProgram(
        program: "KPSCS",
        client: "WORLD BANK",
        color: "red",
        icon: "ALL",
      ),
    ];
  }
}

List<UserProgram> gprograms = UserProgram.getUserPrograms();

class addprogram extends StatelessWidget {
  List<UserProgram> users;
  addprogram({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD program"),
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

    return Column(
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
              hintText: 'icon  ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
          child: ElevatedButton(
              onPressed: () {
                gprograms.add(UserProgram(
                  program: Controller.text,
                  client: lastnameController.text,
                  color: usernameController.text,
                  icon: clientController.text,
                ));

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
