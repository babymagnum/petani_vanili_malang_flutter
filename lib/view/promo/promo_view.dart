import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/view/promo/widgets/list_promo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'stores/promo_stores.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoView extends StatefulWidget {
  @override
  _PromoViewState createState() => _PromoViewState();
}

class _PromoViewState extends State<PromoView> {

  var _promoStores = locator<PromoStores>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          width: size.width, height: size.height,
          color: ThemeColor.primary,
        ),
        Parent(
          style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..width(size.width)..padding(top: 5),
          child: NotificationListener(
            child: ListView.builder(
              itemCount: _promoStores.listPromo.length,
              itemBuilder: (_, index) => ListPromoItem(
                  item: _promoStores.listPromo[index],
                  isLast: index == _promoStores.listPromo.length - 1
              ),
            ),
          ),
        ),
      ],
    );
  }
}
