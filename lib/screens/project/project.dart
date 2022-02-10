// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';
import 'package:tpfm_app/screens/program/addprogram.dart';
import 'package:tpfm_app/screens/program/link.dart';
import 'package:tpfm_app/screens/project/addclient.dart';
import 'package:tpfm_app/screens/project/addproject.dart';

class project extends StatefulWidget {
  project() : super();

  final String title = "Project & Client";

  @override
  projectstate createState() => projectstate();
}

class projectstate extends State<project> {
  late List<projectclass> users;
  late List<projectclass> selectedUsers;
  late bool sort;
  @override
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = gprojects;
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.projectname.compareTo(b.projectname));
      } else {
        users.sort((a, b) => b.projectname.compareTo(a.projectname));
      }
    }
  }

  onSelectedRow(bool selected, projectclass user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<projectclass> temp = [];
        temp.addAll(selectedUsers);
        for (projectclass user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      //scrollDirection: Axis.vertical,
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          sortAscending: sort,
          sortColumnIndex: 0,
          columns: [
            const DataColumn(
              label: Text("CLient"),
              numeric: false,
            ),
            DataColumn(
                label: const Text("Project"),
                numeric: false,
                onSort: (columnIndex, ascending) {
                  setState(() {
                    sort = !sort;
                  });
                  onSortColum(columnIndex, ascending);
                }),
            const DataColumn(
              label: Text("Color"),
              numeric: false,
            ),
            const DataColumn(
              label: Text("option"),
              numeric: false,
              tooltip: "This is type Name",
            ),
          ],
          rows: users
              .map(
                (user) => DataRow(
                    selected: selectedUsers.contains(user),
                    onSelectChanged: (b) {
                      onSelectedRow(b!, user);
                    },
                    cells: [
                      DataCell(
                        Text(user.client),
                      ),
                      DataCell(
                        Text(user.projectname),
                        onTap: () {
                          //  print('Selected ${user.client}');
                        },
                      ),
                      DataCell(
                        Text(user.color),
                      ),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      // Retrieve the text the that user has entered by using the
                                      // TextEditingController.
                                      content: Text(
                                          "Delete and Add Again With Modifications"),
                                    );
                                  },
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  onSortColum(0, true);
                });
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
              child: dataBody(),
            ),
            Row(children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: ElevatedButton(
                  child: const Text("Addclient"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addclient(
                                users: users,
                              )),
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addproject(
                                    users: users,
                                  )),
                        );
                      },
                      child: const Text("Add project")))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    child: Text('SELECTED ${selectedUsers.length}'),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    child: const Text('DELETE SELECTED'),
                    onPressed: selectedUsers.isEmpty
                        ? null
                        : () {
                            deleteSelected();
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
