import 'package:flutter/material.dart';

class visitclass {
  String client;
  String color;
  String observation;

  visitclass({
    required this.client,
    required this.color,
    required this.observation,
  });

  static List<visitclass> getprojectclass() {
    return <visitclass>[
      visitclass(
        client: "UNICEF",
        color: "BLUE",
        observation: "wash",
      ),
      visitclass(
        client: "UNICEF",
        color: "Light Green",
        observation: "health",
      ),
      visitclass(
        client: "UNICEF",
        color: "GREEN",
        observation: "education",
      ),
      visitclass(
        client: "WORLD BANK",
        color: "dark blue",
        observation: "education",
      ),
      visitclass(
        client: "WORLD BANK",
        color: "red",
        observation: "ALL",
      ),
    ];
  }
}

List<visitclass> gvisit = visitclass.getprojectclass();





class addvisit extends StatelessWidget {
  List<visitclass> users;
  addvisit({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD Project"),
      ),
      body: MyCustomForm(
        users: users,
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  List<visitclass> users;
  List<visitclass> getUsers() {
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
              hintText: 'Observation',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Color',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
          child: ElevatedButton(
              onPressed: () {
                gvisit.add(visitclass(
                  client: Controller.text,
                  observation: lastnameController.text,
                  color: usernameController.text,
                  
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