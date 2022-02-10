import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/drawer/drawer.dart';

// ignore: must_be_immutable
class ContentsScreen extends StatelessWidget {
  ContentsScreen({Key? key}) : super(key: key);

  final columnFontSize = 17.0, dataCellFontSize = 16.0;

  List tableColumns = [
    "Title",
    "Contents",
    "Meta Tags",
    "Meta Contents",
    "Status",
    "Options",
  ];

  List tableRows = [
    {
      "title": "UNICEF GIS Sidemenu",
      "contents": "Health: To achieve the millen",
      "meta tags": "mmm",
      "meta contents": "mmm",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "UNICEF Home",
      "contents": "Welcome to our dynamic M &am",
      "meta tags": "",
      "meta contents": "",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "World Bank Login Sidemenu",
      "contents": "FATA Urban Centers. KP Sout",
      "meta tags": "",
      "meta contents": "",
      "status": "Inactive",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "UNICEF Home Sidemenu",
      "contents": "Thank you for visiting",
      "meta tags": "mmm",
      "meta contents": "mmm",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "Action Plans",
      "contents": "In these areas, we deal with p",
      "meta tags": "",
      "meta contents": "",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "Database",
      "contents": "this mian description of staf",
      "meta tags": "",
      "meta contents": "",
      "status": "Inactive",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "Pictures",
      "contents": "Apex consulting services focus",
      "meta tags": "",
      "meta contents": "",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "Success Stories",
      "contents": "We implement public sector pro",
      "meta tags": "",
      "meta contents": "",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "Current PCA's",
      "contents": "Our resources consist of in-ho",
      "meta tags": "",
      "meta contents": "",
      "status": "Inactive",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "Group",
      "contents": "Apex Consulting Group Ltd is t",
      "meta tags": "",
      "meta contents": "",
      "status": "Inactive",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "World Bank",
      "contents": "Introduction to World Bank Thi",
      "meta tags": "",
      "meta contents": "",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
    {
      "title": "World Bank Sidemenu",
      "contents": "FATA Rural Roads: Rural roa",
      "meta tags": "",
      "meta contents": "",
      "status": "Active",
      "options": Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: const Color(0xff444444),
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contents"),
      ),
      drawer: Mydrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
                columns: tableColumns
                    .map((text) => DataColumn(
                            label: Text(
                          text,
                          style: TextStyle(fontSize: columnFontSize),
                        )))
                    .toList(),
                rows: tableRows
                    .map((row) => DataRow(cells: [
                          DataCell(Text(
                            row['title'],
                            style: TextStyle(fontSize: dataCellFontSize),
                          )),
                          DataCell(Text(
                            row['contents'],
                            style: TextStyle(fontSize: dataCellFontSize),
                          )),
                          DataCell(Text(
                            row['meta tags'],
                            style: TextStyle(fontSize: dataCellFontSize),
                          )),
                          DataCell(Text(
                            row['meta contents'],
                            style: TextStyle(fontSize: dataCellFontSize),
                          )),
                          DataCell(Text(
                            row['status'],
                            style: TextStyle(fontSize: dataCellFontSize),
                          )),
                          DataCell(row['options']),
                        ]))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
