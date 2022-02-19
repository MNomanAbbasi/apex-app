// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/export/export.dart';
import 'package:tpfm_app/screens/members/members.dart';
import 'package:tpfm_app/screens/members/user.dart';
import 'package:tpfm_app/screens/program/program.dart';
import 'package:tpfm_app/screens/reports/addreport.dart';
import 'package:tpfm_app/screens/reports/reports.dart';
import './screens/contents/contents.dart';

class AllScreens extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final currentIndex;

  const AllScreens({required this.currentIndex});

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  int currentIndex = 0;

  List screens = [
    ContentsScreen(),
    members(),
    ReportsScreen(),
    ExportScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "CONTENTS"),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "MEMBERS",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.record_voice_over), label: "REPORTS"),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: "EXPORT",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
