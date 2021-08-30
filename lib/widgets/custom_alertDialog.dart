import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/model/color_model.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: CircleAvatar(
          radius: 35,
          backgroundColor: ColorModel.mainColor,
          child: Icon(
            Icons.close,
            size: 35,
            color: ColorModel.whiteColor,
          ),
        ),
        content: Text(
          AppLocalizations.of(context).translate('Error_massage').toString(),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              AppLocalizations.of(context).translate('Error_button').toString(),
              style: TextStyle(
                  color: ColorModel.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
