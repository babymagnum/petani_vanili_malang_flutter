import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPromoBerandaShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(left: index == 0 ? 16.w : 0, right: index == 5 - 1 ? 16.w : 10.w),
        child: PlaceholderContainerShimmer(
            size: Size((size.width * 0.7).toInt().toDouble() - 10, 120),
            borderRadius: 5
        ),
      ),
    );
  }
}
