// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tpfm_app/screens/program/addprogram.dart';
import 'package:tpfm_app/screens/reports/reports.dart';

class REPORTS extends StatefulWidget {
  String clientval;
  String Provinceval;
  String ipval;
  REPORTS({
    Key? key,
    required this.clientval,
    required this.Provinceval,
    required this.ipval,
  }) : super(key: key);
  @override
  State<REPORTS> createState() => _linkState();
}

class _linkState extends State<REPORTS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REPORT"),
      ),
      body: linkbody(
        clientval1: widget.clientval,
        Provinceval1: widget.Provinceval,
        ipval1: widget.ipval,
      ),
    );
  }
}

// ignore: camel_case_types
class linkbody extends StatefulWidget {
  String clientval1;
  String Provinceval1;
  String ipval1;
  linkbody({
    Key? key,
    required this.clientval1,
    required this.Provinceval1,
    required this.ipval1,
  }) : super(key: key);
  @override
  State<linkbody> createState() => _linkbodyState();
}

class _linkbodyState extends State<linkbody> {
  var Controller = TextEditingController();

  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();
  @override
  void initState() {
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
          List hello = [];
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
            hello = storedocs
                .where((element) => element['Client'] == widget.clientval1)
                .toList();
          }).toList();
          print(storedocs);
          print(hello);
          print(widget.Provinceval1);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text("CLIENT"),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text("PROVINCE"),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text("IP"),
                        numeric: false,
                      ),
                      const DataColumn(
                        label: Text("PROJECT NAME"),
                        numeric: false,
                      ),
                      const DataColumn(
                        label: Text("Program"),
                        numeric: false,
                      ),
                    ],
                    rows: hello
                        .map((user) => DataRow(cells: [
                              DataCell(
                                Text(widget.clientval1),
                              ),
                              DataCell(
                                Text(user['Program']),
                              ),
                              DataCell(
                                Text(widget.ipval1),
                              ),
                              DataCell(
                                Text(widget.Provinceval1),
                              ),
                              DataCell(
                                Text(user['Title']),
                              ),
                            ]))
                        .toList(),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
