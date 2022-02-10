// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';

class ExportScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ExportScreen({Key? key}) : super(key: key);

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
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
  ];

  List IPList = [
    "Select IP",
  ];
  List programList = [
    "Select program",
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var dropdownlistValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Export"),
      ),
      drawer: Mydrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 10.0),
              child: Text(
                "Export Data In Excel Sheet",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
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
                                      style: TextStyle(fontSize: itemFontSize),
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
                                      style: TextStyle(fontSize: itemFontSize),
                                    ),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownProvinceValue = newValue!.toString();
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
                                      style: TextStyle(fontSize: itemFontSize),
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
                                  style: TextStyle(fontSize: itemFontSize),
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
                                      style: TextStyle(fontSize: itemFontSize),
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
                    alignment: Alignment.centerLeft,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: labelFontSize),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
