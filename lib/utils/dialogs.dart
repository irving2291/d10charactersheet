import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static alert(
      BuildContext context,
      {
        required String title,
        required String description,
      }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(_);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}

class ProgressDialog {
  static show (BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.9),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          onWillPop: () async => false,
        );
      },
    );
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}