import 'dart:math';

import 'package:division/division.dart';
import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProductShimmer extends StatelessWidget {

  ItemProductShimmer({Key key, @required this.index}): super(key: key);

  final int index;

  final _random = Random();
  int _next(int min, int max) => min + _random.nextInt(max - min);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      style: ParentStyle()..border(all: 1.5, color: Colors.black.withAlpha(25))..borderRadius(all: 10)..background.color(Colors.white)
        ..margin(top: index <= 1 ? 30.h : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PlaceholderContainerShimmer(size: Size(size.width, 70), borderRadius: 10),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PlaceholderContainerShimmer(size: Size(_next(50, 130).toDouble(), 16), borderRadius: 1000),
                SizedBox(height: 5.h,),
                PlaceholderContainerShimmer(size: Size(_next(70, 85).toDouble(), 14), borderRadius: 1000),
                SizedBox(height: 9.h,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
