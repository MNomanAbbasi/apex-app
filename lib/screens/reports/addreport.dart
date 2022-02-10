// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class AddReport extends StatefulWidget {
  AddReport({Key? key}) : super(key: key);

  @override
  State<AddReport> createState() => _addReportScreenState();
}

class _addReportScreenState extends State<AddReport> {
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

  // ignore: non_constant_identifier_names
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
        title: const Text("Add Report"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
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
                                        style:
                                            TextStyle(fontSize: itemFontSize),
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
                                        style:
                                            TextStyle(fontSize: itemFontSize),
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
                                        style:
                                            TextStyle(fontSize: itemFontSize),
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
                                        style:
                                            TextStyle(fontSize: itemFontSize),
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
                    Row(
                      children: [
                        const Text(
                          "Date: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Name of Monitor: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "Tehsil: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                            height: 40,
                            width: 100,
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "District: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "Union council: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "Site Name: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "North: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "East: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "type of site: ",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                hintText: "village or formal camp"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: labelFontSize),
                          ),
                          onPressed: () {showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      // Retrieve the text the that user has entered by using the
                                      // TextEditingController.
                                      content: Text(
                                          "Report Submitted"),
                                    );
                                  },
                                );},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
