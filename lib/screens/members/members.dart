import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';

import 'user.dart';

class DataTableDemo extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const DataTableDemo() : super();

  final String title = "Members";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  late List<User> users;
  late List<User> selectedUsers;
  late bool sort;
  @override
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = gusers;
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  changestatus(User user) {
    if (user.status == "active") {
      user.status = "inActive";
    } else {
      user.status = "active";
    }
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
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
                label: const Text("FIRST NAME"),
                numeric: false,
                tooltip: "This is First Name",
                onSort: (columnIndex, ascending) {
                  setState(() {
                    sort = !sort;
                  });
                  onSortColum(columnIndex, ascending);
                }),
            const DataColumn(
              label: Text("Last name"),
              numeric: false,
              tooltip: "This is Last Name",
            ),
            const DataColumn(
              label: Text("user name"),
              numeric: false,
              tooltip: "This is user Name",
            ),
            const DataColumn(
              label: Text("province"),
              numeric: false,
              tooltip: "This is province Name",
            ),
            const DataColumn(
              label: Text("project"),
              numeric: false,
              tooltip: "This is project Name",
            ),
            const DataColumn(
              label: Text("type"),
              numeric: false,
              tooltip: "This is type Name",
            ),
            const DataColumn(
              label: Text("status"),
              numeric: false,
              tooltip: "This is type Name",
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
                        Text(user.firstName),
                        onTap: () {
                          //print('Selected ${user.firstName}');
                        },
                      ),
                      DataCell(
                        Text(user.lastName),
                      ),
                      DataCell(
                        Text(user.username),
                      ),
                      DataCell(
                        Text(user.clientprovince),
                      ),
                      DataCell(
                        Text(user.project),
                      ),
                      DataCell(
                        Text(user.type),
                      ),
                      DataCell(
                        Text(user.status),
                      ),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: const Color(0xff444444),
                              icon: const Icon(Icons.settings),
                              onPressed: () {
                                setState(() {
                                  changestatus(user);
                                });
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
    return Scaffold(
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
                onSortColum(0, false);
              });
            },
          )
        ],
      ),
      drawer: Mydrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
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
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => adduser(
                                    users: users,
                                  )),
                        );
                      },
                      child: const Text("Add"))),
            ],
          ),
        ],
      ),
    );
  }
}
