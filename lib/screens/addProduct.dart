import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct extends StatelessWidget {
  final nameController = TextEditingController();
  final rollnoController = TextEditingController();
  final nameController3 = TextEditingController();
  final rollnoController4 = TextEditingController();
  final nameController5 = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title ',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            ),
            TextField(
              controller: rollnoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Content  ',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            ),
            TextField(
              controller: nameController3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Meta_tags  ',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            ),
            TextField(
              controller: rollnoController4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'meta_content  ',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            ),
            TextField(
              controller: nameController5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Status  ',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("contents")
                    .doc()
                    .set({
                  "Title": nameController.text,
                  "Contents": rollnoController.text,
                  "Meta_tags": nameController3.text,
                  "Meta_contents": rollnoController4.text,
                  "Status": nameController5.text,
                });
              },
              child: Text("Submit"),
            ),
          ],
        ),
      )),
    );
  }
}
