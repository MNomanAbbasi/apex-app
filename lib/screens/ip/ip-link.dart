import 'package:flutter/material.dart';

import 'package:tpfm_app/screens/program/addprogram.dart';

class IPlink extends StatefulWidget {
  @override
  State<IPlink> createState() => _linkState();
}

class _linkState extends State<IPlink> {
  late List<UserProgram> users;

  @override
  void initState() {
    users = gprograms;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LINk"),
      ),
      body: linkbody(
        users: users,
      ),
    );
  }
}

// ignore: camel_case_types
class linkbody extends StatefulWidget {
  List<UserProgram> users;

  linkbody({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  State<linkbody> createState() => _linkbodyState();
}

class _linkbodyState extends State<linkbody> {
  // ignore: non_constant_identifier_names
  var Controller = TextEditingController();
  late List<UserProgram> contains;
  @override
  void initState() {
    findPersonUsingWhere(Controller.text);

    super.initState();
  }

  bool findPersonUsingWhere(String client) {
    // Return list of people matching the condition
    contains =
        widget.users.where((element) => element.client == client).toList();

    if (contains.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  SingleChildScrollView body1() {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text("PROGRAM"),
            numeric: false,
          ),
        ],
        rows: contains
            .map((user) => DataRow(cells: [
                  DataCell(
                    Text(user.program),
                  ),
                ]))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (findPersonUsingWhere(Controller.text)) {
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
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text("no record founded"),
                          );
                        },
                      );
                    }
                  });
                },
                child: const Text("submit")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: body1(),
          )
        ]);
  }
}
