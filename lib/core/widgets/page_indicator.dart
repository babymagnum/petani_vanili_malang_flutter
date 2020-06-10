import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {

  PageIndicator({Key key, this.color, this.isFirst, this.isLast, this.isSelected}): super(key: key);

  final Color color;
  final bool isFirst;
  final bool isLast;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: isFirst ? 0 : 5, right: isLast ? 0 : 5,),
      duration: Duration(milliseconds: 200),
      height: 10.h,
      width: isSelected ? 25.h : 10.h,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(isSelected ? 1000 : 5))
      ),
    );
  }
}
