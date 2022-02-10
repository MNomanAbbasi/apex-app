import 'package:flutter/material.dart';

class projectclass {
  String projectname;
  String client;
  String color;
  String icon;

  projectclass({
    required this.projectname,
    required this.client,
    required this.color,
    required this.icon,
  });

  static List<projectclass> getprojectclass() {
    return <projectclass>[
      projectclass(
        projectname: "WASH",
        client: "UNICEF",
        color: "BLUE",
        icon: "wash",
      ),
      projectclass(
        projectname: "HEALTH",
        client: "UNICEF",
        color: "Light Green",
        icon: "health",
      ),
      projectclass(
        projectname: "EDUCATION",
        client: "UNICEF",
        color: "GREEN",
        icon: "education",
      ),
      projectclass(
        projectname: "EDUCATION",
        client: "WORLD BANK",
        color: "dark blue",
        icon: "education",
      ),
      projectclass(
        projectname: "KPSCS",
        client: "WORLD BANK",
        color: "red",
        icon: "ALL",
      ),
    ];
  }
}

List<projectclass> gprojects = projectclass.getprojectclass();

class Addproject extends StatelessWidget {
  List<projectclass> users;
  Addproject({
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
  List<projectclass> users;
  List<projectclass> getUsers() {
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
              hintText: 'Project Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: lastnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Client Name',
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
                gprojects.add(projectclass(
                  projectname: Controller.text,
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
