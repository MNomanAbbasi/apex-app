// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';
import 'package:tpfm_app/screens/ip/add-ip.dart';
import 'package:tpfm_app/screens/ip/ip-link.dart';
import 'package:tpfm_app/screens/program/addprogram.dart';

class IP extends StatefulWidget {
  IP() : super();

  final String title = "IP";

  @override
  IPstate createState() => IPstate();
}

class IPstate extends State<IP> {
  late List<UserProgram> users;
  late List<UserProgram> selectedUsers;
  late bool sort;
  @override
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = gprograms;
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.program.compareTo(b.program));
      } else {
        users.sort((a, b) => b.program.compareTo(a.program));
      }
    }
  }

  onSelectedRow(bool selected, UserProgram user) async {
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
        List<UserProgram> temp = [];
        temp.addAll(selectedUsers);
        for (UserProgram user in temp) {
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
                label: const Text("Program"),
                numeric: false,
                onSort: (columnIndex, ascending) {
                  setState(() {
                    sort = !sort;
                  });
                  onSortColum(columnIndex, ascending);
                }),
            const DataColumn(
              label: Text("Title"),
              numeric: false,
            ),
            const DataColumn(
              label: Text("Color"),
              numeric: false,
            ),
            const DataColumn(
              label: Text("option"),
              numeric: false,
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
                        Text(user.program),
                        onTap: () {
                          //  print('Selected ${user.client}');
                        },
                      ),
                      DataCell(
                        Text(user.icon),
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
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: ElevatedButton(
                  child: const Text("Link"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IPlink()),
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
                              builder: (context) => addIP(
                                    users: users,
                                  )),
                        );
                      },
                      child: const Text("Add")))
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
