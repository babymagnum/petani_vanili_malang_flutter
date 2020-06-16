import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CommonFunction {

  static showSnackbarLoading(context, String content) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
            duration: Duration(hours: 1),
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(content, style: ThemeTextStyle.ubuntuR.apply(
                      color: Colors.white, fontSizeDelta: 14.ssp
                  )),
                )
              ],
            )
        )
    );
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static showErrorSnackbar(context, String errorMessage, String actionLabel, Function onPressed) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 2),
            action: SnackBarAction(label: actionLabel, onPressed: onPressed),
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.error, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Flexible(
                  child: Text(errorMessage, style: ThemeTextStyle.ubuntuR.apply(
                      color: Colors.white, fontSizeDelta: 14.ssp
                  )),
                )
              ],
            )
        )
    );
  }

  static showSuccessSnackbar(context, String content) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 1),
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.done, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Flexible(
                  child: Text(content, style: ThemeTextStyle.ubuntuR.apply(
                      color: Colors.white, fontSizeDelta: 14.ssp
                  )),
                )
              ],
            )
        )
    );
  }
}