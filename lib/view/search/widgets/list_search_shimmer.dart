import 'dart:math';
import 'package:division/division.dart';
import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListSearchShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final random = Random();
    int next(int min, int max) => min + random.nextInt(max - min);

    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Parent(
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
                  PlaceholderContainerShimmer(size: Size(next(50, 130).toDouble(), 16), borderRadius: 1000),
                  SizedBox(height: 5.h,),
                  PlaceholderContainerShimmer(size: Size(next(70, 85).toDouble(), 14), borderRadius: 1000),
                  SizedBox(height: 9.h,)
                ],
              ),
            )
          ],
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 8.h,
      crossAxisSpacing: 8.h,
    );
  }
}
