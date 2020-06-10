import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/fonts.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../beranda/stores/beranda_stores.dart';

class TentangKamiView extends StatefulWidget {
  @override
  _TentangKamiViewState createState() => _TentangKamiViewState();
}

class _TentangKamiViewState extends State<TentangKamiView> {

  var _berandaStores = locator<BerandaStores>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        body: Stack(
          children: <Widget>[
            Container(height: size.height, width: size.width,),
            Stack(
              children: <Widget>[
                PlaceholderNetworkImage(
                  url: _berandaStores.merchantDetailData.merchant.logo,
                  size: Size(size.width, size.height / 2.25),
                  borderRadius: 0,
                  imageFit: BoxFit.cover,
                ),
                Container(
                  height: size.height / 2.25, width: size.width,
                  color: Colors.black.withOpacity(0.37),
                ),
                Positioned(
                  top: 20.h + MediaQuery.of(context).padding.top, left: 16.w,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/images/ic_arrow-left.png', width: 24.w, height: 24.h,),
                  ),
                )
              ],
            ),
            Positioned(
              left: 0, right: 0, top: (size.height / 2.25) - 32, bottom: 0,
              child: Parent(
                style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..padding(horizontal: 16.w, top: 3),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40.h,),
                      Text('Tentang Kami', style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 24.ssp),),
                      SizedBox(height: 30.h,),
                      Text(_berandaStores.merchantDetailData.merchant.description ?? '', style: TextStyle(height: 1.25, fontFamily: Fonts.raleway, fontWeight: Fonts.ralewayRegular, fontSize: 12.ssp,),),
                      SizedBox(height: 20.h,)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
