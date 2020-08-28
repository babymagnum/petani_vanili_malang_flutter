import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonReload extends StatelessWidget {

  ButtonReload({@required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset('assets/images/Refresh.svg', width: 13.w, height: 13.w, color: ThemeColor.primary,),
          SizedBox(width: 6.w,),
          Text('Reload data', style: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: 12.ssp, color: ThemeColor.primary),)
        ],
      ),
    );
  }
}
