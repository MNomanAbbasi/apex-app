// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';
import 'package:tpfm_app/screens/reports/addreport.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tpfm_app/screens/reports/report.dart';

class ReportsScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportsScreen> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection("students").snapshots();

  ///for deleting
  CollectionReference students =
      FirebaseFirestore.instance.collection("students");
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  String dropdownClientValue = "Select Client";
  String dropdownProvinceValue = "Select Province";
  String dropdownProjectValue = "Select Project";
  String dropdownIPValue = "Select IP";
  String dropdownProgramValue = "Select program";
  final labelFontSize = 18.0, itemFontSize = 17.0;

  List clientList = [
    "Select Client",
    "UNICEF",
    "UNDP",
    "World Bank",
    "UNHCR",
    "Meda",
  ];

  List provinceList = [
    "Select Province",
    "Balochistan",
    "Khyber Pakhtunkhwa",
    "Punjab",
    "Sindh",
    "FATA",
    "Gilgit Baltistan",
  ];

  List projectList = [
    "Select Project",
    "TPM Regular",
    "TPFM of SPSP",
    "TPFM OF COMNet"
  ];

  List IPList = [
    "Select IP",
    "fwap",
    "CGN",
    " SC",
    "SEED",
    "SSD",
    "SED",
    "SDAS"
  ];

  List programList = [
    "Select program",
    "KP SCS",
    "WASH",
    "EDUCATION",
    "NUTRITION",
    "HEALTH"
  ];
  get() {
    List<String> al = [];
    al.add(dropdownClientValue);
    al.add(dropdownProvinceValue);
    return al;
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
          List hello = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            hello = storedocs
                .where((element) => element['Client'] == dropdownClientValue)
                .toList();
            a['id'] = document.id;
          }).toList();

          //print(hello);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Reports"),
            ),
            drawer: Mydrawer(),
            body: SafeArea(
              child: Column(
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Client: ",
                              style: TextStyle(
                                  fontSize: labelFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              height: 52,
                              child: DropdownButton(
                                items: clientList
                                    .map((item) => DropdownMenuItem(
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: itemFontSize),
                                          ),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownClientValue = newValue!.toString();
                                  });
                                },
                                value: dropdownClientValue,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Province: ",
                              style: TextStyle(
                                  fontSize: labelFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              height: 52,
                              child: DropdownButton(
                                items: provinceList
                                    .map((item) => DropdownMenuItem(
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: itemFontSize),
                                          ),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownProvinceValue =
                                        newValue!.toString();
                                  });
                                },
                                value: dropdownProvinceValue,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Project: ",
                              style: TextStyle(
                                  fontSize: labelFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              height: 52,
                              child: DropdownButton(
                                items: projectList
                                    .map((item) => DropdownMenuItem(
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: itemFontSize),
                                          ),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownProjectValue = newValue!.toString();
                                  });
                                },
                                value: dropdownProjectValue,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "IP: ",
                              style: TextStyle(
                                  fontSize: labelFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              height: 52,
                              child: DropdownButton(
                                items: IPList.map((item) => DropdownMenuItem(
                                      child: Text(
                                        item,
                                        style:
                                            TextStyle(fontSize: itemFontSize),
                                      ),
                                      value: item,
                                    )).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownIPValue = newValue!.toString();
                                  });
                                },
                                value: dropdownIPValue,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Program: ",
                              style: TextStyle(
                                  fontSize: labelFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              height: 52,
                              child: DropdownButton(
                                items: programList
                                    .map((item) => DropdownMenuItem(
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: itemFontSize),
                                          ),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownProgramValue = newValue!.toString();
                                  });
                                },
                                value: dropdownProgramValue,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 45,
                            width: 150,
                            child: ElevatedButton(
                              child: Text(
                                "Submit",
                                style: TextStyle(fontSize: labelFontSize),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => REPORTS(
                                            clientval: dropdownClientValue,
                                            Provinceval: dropdownProvinceValue,
                                            ipval: dropdownIPValue,
                                          )),
                                );
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      // Retrieve the text the that user has entered by using the
                                      // TextEditingController.
                                      content: Text("submitted"),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          child: const Text("add report"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddReport()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class share {
  late String clientval;
  late String Provinceval;
  late String ipval;

  mat() {}
}
