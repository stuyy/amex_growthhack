import 'package:flutter/material.dart';

class BaseFormField {

  final TextEditingController controller;
  final String title;
  final String subtitle;
  final int length;

  BaseFormField(this.controller, this.title, this.subtitle, this.length);

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 8, right: 10, left: 10),
        child: Column(
          children: [
            ListTile(
              title: Text(this.title),
              subtitle: Text(this.subtitle),
            ),
            TextFormField(
              controller: this.controller,
              maxLength: this.length,
              maxLines: 10,
              minLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
              ),
              validator: (value) {
                print(value);
                if (value.isEmpty) return 'Please enter something';
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}