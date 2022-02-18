// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpfm_app/all_screens.dart';
import 'package:tpfm_app/screens/checklist/categoryquestion.dart';
import 'package:tpfm_app/screens/contents/contents.dart';
import 'package:tpfm_app/screens/export/export.dart';
import 'package:tpfm_app/screens/members/members.dart';
import 'package:tpfm_app/screens/program/program.dart';
import 'package:tpfm_app/screens/project/project.dart';
import 'package:tpfm_app/screens/reports/reports.dart';
import 'package:tpfm_app/screens/visit%20status/visit.dart';

// ignore: use_key_in_widget_constructors
class Mydrawer extends StatelessWidget {
  var imageurl =
      "https://www.logolynx.com/images/logolynx/38/38d62559b79196f2ddf790393a11957a.jpeg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text(""),
            ),
            decoration: BoxDecoration(color: Colors.black),
          ),
          ListTile(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllScreens(currentIndex: 0)),
              );
            }),
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.black54,
            ),
            title: const Text(
              "Main Screen",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentsScreen()),
              );
            }),
            leading: const Icon(
              CupertinoIcons.list_bullet,
              color: Colors.black54,
            ),
            title: const Text(
              "Contents",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => members()),
              );
            }),
            leading: const Icon(
              Icons.people,
              color: Colors.black54,
            ),
            title: const Text(
              "Members",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Visit()),
              );
            },
            leading: Icon(
              CupertinoIcons.check_mark_circled,
              color: Colors.black54,
            ),
            title: Text(
              "visit Status",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => category()),
              );
            },
            leading: const Icon(
              Icons.list_alt_rounded,
              color: Colors.black54,
            ),
            title: const Text(
              "checklist",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => project()),
              );
            },
            leading: const Icon(
              CupertinoIcons.add_circled_solid,
              color: Colors.black54,
            ),
            title: const Text(
              "project",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => program()),
              );
            }),
            leading: const Icon(
              CupertinoIcons.folder_circle,
              color: Colors.black54,
            ),
            title: const Text(
              "program",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsScreen()),
              );
            }),
            leading: const Icon(
              Icons.record_voice_over,
              color: Colors.black54,
            ),
            title: const Text(
              "REPORT",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
          ListTile(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExportScreen()),
              );
            }),
            leading: const Icon(
              Icons.send,
              color: Colors.black54,
            ),
            title: const Text(
              "EXPORT",
              style: TextStyle(color: Colors.black54),
              textScaleFactor: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
