// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tpfm_app/screens/program/addprogram.dart';
import 'package:tpfm_app/screens/program/link.dart';
import 'package:tpfm_app/screens/visit%20status/addvisit.dart';
import 'package:tpfm_app/screens/visit%20status/updatevisit.dart';

class Visit extends StatefulWidget {
  Visit() : super();

  final String title = "VISIT";

  @override
  IPstate createState() => IPstate();
}

class IPstate extends State<Visit> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection("Visit").snapshots();

  ///for deleting
  CollectionReference students = FirebaseFirestore.instance.collection("Visit");
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  late bool sort;
  @override
  @override
  void initState() {
    sort = false;
    super.initState();
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

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          // print(storedocs);
          print(storedocs.length);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ],
              ),
              drawer: Mydrawer(),
              body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      //scrollDirection: Axis.vertical,
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          sortAscending: sort,
                          sortColumnIndex: 0,
                          columns: [
                            const DataColumn(
                              label: Text("cLient"),
                              numeric: false,
                            ),
                            DataColumn(
                                label: const Text("Observation"),
                                numeric: false,
                                onSort: (columnIndex, ascending) {
                                  setState(() {
                                    sort = !sort;
                                  });
                                }),
                            const DataColumn(
                              label: Text("color"),
                              numeric: false,
                            ),
                            const DataColumn(
                              label: Text("option"),
                              numeric: false,
                            ),
                          ],
                          rows: storedocs
                              .map(
                                (user) => DataRow(cells: [
                                  DataCell(
                                    Text(user['client']),
                                  ),
                                  DataCell(
                                    Text(user['observation']),
                                    onTap: () {
                                      //  print('Selected ${user.client}');
                                    },
                                  ),
                                  DataCell(
                                    Text(user['color']),
                                  ),
                                  DataCell(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          color: const Color(0xff444444),
                                          icon: const Icon(Icons.settings),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                        IconButton(
                                          color: const Color(0xff444444),
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            setState(() {
                                              deleteUser(user['id']);
                                            });
                                          },
                                        ),
                                        IconButton(
                                          color: const Color(0xff444444),
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    updatevisit(id: user['id']),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addvisit()),
                              );
                            },
                            child: const Text("Add")))
                  ]),
                ],
              ),
            ),
          );
        });
  }
}
