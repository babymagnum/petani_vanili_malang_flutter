import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/product/item_product.dart';
import 'package:dribbble_clone/view/detail_produk/detail_produk_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListProdukItem extends StatelessWidget {
  
  ListProdukItem({Key key, @required this.item, @required this.isBot, @required this.isTop}): super(key: key);
  
  final ItemProduct item;
  final bool isTop;
  final bool isBot;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      gesture: Gestures()..onTap(() => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailProdukView(itemProduct: item,)))),
      style: ParentStyle()..borderRadius(all: 10)..border(all: 1.5, color: Colors.black.withAlpha(25))
        ..padding(horizontal: 11.w)..background.color(Colors.white)..margin(top: isTop ? 30.h : 0, bottom: isBot ? 30.h : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.h,),
          PlaceholderNetworkImage(
            url: item.images[0],
            size: Size(size.width, 50.h),
            borderRadius: 0,
            imageFit: BoxFit.contain,
          ),
          SizedBox(height: 10.h,),
          Text(item.name ?? '', maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.ralewayMedium.apply(color: ThemeColor.primary, fontSizeDelta: 10.ssp),),
          SizedBox(height: 5.h,),
          Text(TextUtil.toRupiah(item.min_price ?? 0), maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.ralewayRegular.apply(color: Colors.black, fontSizeDelta: 8.ssp),),
          SizedBox(height: 9.h,)
        ],
      ),
    );
  }
}
