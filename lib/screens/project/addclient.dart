import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/project/addproject.dart';

class addclient extends StatelessWidget {
  List<projectclass> users;
  addclient({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD client"),
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
              hintText: 'Title',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: lastnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Color',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Project Type',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
          child: ElevatedButton(
              onPressed: () {
                gprojects.add(projectclass(
                  projectname: usernameController.text,
                  client: Controller.text,
                  color: lastnameController.text,
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
