import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
   final bool isChecked;
   final String title;
   final Function checkboxCallback;
   final Function longPressCallBack;
   TaskTitle({this.isChecked,this.title,@required this.checkboxCallback,this.longPressCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        onChanged: checkboxCallback,
        value: isChecked,
      ),
      onLongPress: longPressCallBack,
    );
  }
}