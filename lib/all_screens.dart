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
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? const Icon(
                      Icons.list_outlined,
                      color: Colors.black,
                      size: 35,
                    )
                  : const Icon(
                      Icons.list,
                      color: Colors.black,
                      size: 35,
                    ),
              label: "CONTENTS"),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 35,
                  ),
            label: "MEMBERS",
          ),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? const Icon(
                      Icons.record_voice_over,
                      color: Colors.black,
                      size: 35,
                    )
                  : const Icon(
                      Icons.record_voice_over_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
              label: "REPORTS"),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? const Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.send_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
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
