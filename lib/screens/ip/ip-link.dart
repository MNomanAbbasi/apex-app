import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List hello = [];
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
            hello = storedocs
                .where((element) => element['Program'] == "program")
                .toList();
          }).toList();
          print(hello);

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Program',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (hello != null) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Text("PROGRAM"),
                          numeric: false,
                        ),
                      ],
                      rows: hello
                          .map((user) => DataRow(cells: [
                                DataCell(
                                  Text(user['Client']),
                                ),
                              ]))
                          .toList(),
                    ),
                  ),
                )
              ]);
        });
  }
}
