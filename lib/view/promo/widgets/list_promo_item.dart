import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/promo_model.dart';
import 'package:dribbble_clone/view/detail_promo/detail_promo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPromoItem extends StatelessWidget {

  ListPromoItem({Key key, @required this.item, @required this.isLast}): super(key: key);

  final PromoModel item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPromoView())),
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: isLast ? 15 : 0, left: 16.w, right: 16.w),
        child: Stack(
          children: <Widget>[
            PlaceholderNetworkImage(
              url: item.image,
              size: Size(size.width, 180.h),
              borderRadius: 10,
              imageFit: BoxFit.cover,
            ),
            Positioned(
              left: 10.w, bottom: 10.h, right: (size.width - 32.w - 12.w) / 2,
              child: Parent(
                style: ParentStyle()..background.color(Colors.black.withOpacity(0.5))..borderRadius(all: 5)..padding(all: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.title, maxLines: 3, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.ralewaySemiBold.apply(color: Colors.white, fontSizeDelta: 13.ssp),),
                    Text(item.description, style: ThemeTextStyle.ralewayRegular.apply(color: Colors.white, fontSizeDelta: 8.ssp),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
