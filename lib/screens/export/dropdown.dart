// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  State<DropDown> createState() => _DropDownState();

  var dropdownList, dropdownValue;

  DropDown({required this.dropdownList, required this.dropdownValue});
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: DropdownButton(
        items: widget.dropdownList
            .map((client) => DropdownMenuItem(
                  child: Text(client),
                  value: client,
                ))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            widget.dropdownValue = newValue!.toString();
          });
        },
        value: widget.dropdownValue,
      ),
    );
  }
}
