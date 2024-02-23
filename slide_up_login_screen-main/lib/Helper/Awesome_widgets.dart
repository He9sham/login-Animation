import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void Awesome_widgets(
    BuildContext context, DialogType dialogType, String title, String desc) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnOkOnPress: () {},
  ).show();
}
