import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/checklist/add-category.dart';
import 'package:tpfm_app/screens/checklist/addoption.dart';
import 'package:tpfm_app/screens/checklist/addquestion.dart';
import 'package:tpfm_app/screens/checklist/checklink.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';

import 'package:tpfm_app/screens/visit%20status/addvisit.dart';

class Checklist extends StatefulWidget {
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Checklist() : super();

  final String title = "CheckList";

  @override
  checkliststate createState() => checkliststate();
}

class checkliststate extends State<Checklist> {
  late List<visitclass> users;
  late List<visitclass> selectedUsers;
  late bool sort;
  @override
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = gvisit;
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.client.compareTo(b.client));
      } else {
        users.sort((a, b) => b.client.compareTo(a.client));
      }
    }
  }

  onSelectedRow(bool selected, visitclass user) async {
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
        List<visitclass> temp = [];
        temp.addAll(selectedUsers);
        for (visitclass user in temp) {
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
            DataColumn(
                label: const Text("Client"),
                numeric: false,
                onSort: (columnIndex, ascending) {
                  setState(() {
                    sort = !sort;
                  });
                  onSortColum(columnIndex, ascending);
                }),
            const DataColumn(
              label: Text("category"),
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
                        Text(user.observation),
                        onTap: () {
                          //  print('Selected ${user.client}');
                        },
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  child: const Text("Add Category"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addcategory(
                                users: users,
                              )),
                    );
                  },
                ),
              ),
            ]),
            Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  child: const Text("Add question"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => addquestion()),
                    );
                  },
                ),
              ),
            ]),
            Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  child: const Text("Add option"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addoption(
                                users: [],
                              )),
                    );
                  },
                ),
              ),
            ]),
            Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  child: const Text("LInk"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => checklink()),
                    );
                  },
                ),
              ),
            ]),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    child: Text('SELECTED ${selectedUsers.length}'),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
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
