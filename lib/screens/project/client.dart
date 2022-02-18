// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tpfm_app/screens/project/addclient.dart';

import 'package:tpfm_app/screens/project/updateclient.dart';

class client extends StatefulWidget {
  const client() : super();

  final String title = "Client";

  @override
  IPstate createState() => IPstate();
}

class IPstate extends State<client> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection("Client").snapshots();

  ///for deleting
  CollectionReference students =
      FirebaseFirestore.instance.collection("Client");
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
            return const Center(
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
                              label: Text("Title"),
                              numeric: false,
                            ),
                            DataColumn(
                                label: const Text("Status"),
                                numeric: false,
                                onSort: (columnIndex, ascending) {
                                  setState(() {
                                    sort = !sort;
                                  });
                                }),
                            const DataColumn(
                              label: Text("option"),
                              numeric: false,
                            ),
                          ],
                          rows: storedocs
                              .map(
                                (user) => DataRow(cells: [
                                  DataCell(
                                    Text(user['Title']),
                                  ),
                                  DataCell(
                                    Text(user['Status']),
                                    onTap: () {
                                      //  print('Selected ${user.client}');
                                    },
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
                                                    updateclient(
                                                        id: user['id']),
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
                                    builder: (context) => addclient()),
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
