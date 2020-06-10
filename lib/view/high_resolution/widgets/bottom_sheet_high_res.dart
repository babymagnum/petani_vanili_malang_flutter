import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/measure_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../stores/high_res_stores.dart';

class BottomSheetHighRes extends StatelessWidget {

  BottomSheetHighRes({Key key, @required this.produkName, @required this.produkDescription}): super(key: key);

  final String produkDescription;
  final String produkName;

  var _highResStores = locator<HighResStores>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.grey.withAlpha(50))..minHeight(50.h)..padding(bottom: 30.h, top: 20.h, horizontal: 16.w)
        ..width(size.width),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MeasureSize(
            onChange: (Size size) => _highResStores.setTitleHeight(size.height),
            child: Text(produkName, style: ThemeTextStyle.ralewaySemiBold.apply(color: Colors.white, fontSizeDelta: 24.ssp),),
          ),
          SizedBox(height: 16.h,),
          Text(produkDescription, style: ThemeTextStyle.ralewayRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),)
        ],
      ),
    );
  }
}
