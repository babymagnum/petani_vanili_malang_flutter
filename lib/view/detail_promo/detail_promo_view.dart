import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/fonts.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPromoView extends StatefulWidget {
  @override
  _DetailPromoViewState createState() => _DetailPromoViewState();
}

class _DetailPromoViewState extends State<DetailPromoView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(height: size.height, width: size.width,),
          Stack(
            children: <Widget>[
              PlaceholderNetworkImage(
                url: 'https://www.static-src.com/siva/asset//03_2016/BANNER-microheader-TEASER-toyota.jpg',
                size: Size(size.width, size.height / 2.5),
                borderRadius: 0,
                imageFit: BoxFit.cover,
              ),
              Positioned(
                top: 20.h + MediaQuery.of(context).padding.top, left: 16.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Parent(
                    style: ParentStyle()..width(35.h)..height(35.h)..background.color(Colors.black.withOpacity(0.2))..borderRadius(all: 1000),
                    child: Center(
                      child: Image.asset('assets/images/ic_arrow-left.png', width: 24.w, height: 24.h,),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 0, right: 0, top: (size.height / 2.5) - 32, bottom: 0,
            child: Parent(
              style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..padding(horizontal: 16.w, top: 3),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40.h,),
                    Text('Gratis Aksesori di Setiap Pembelian Mobil', style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 24.ssp),),
                    SizedBox(height: 10.h,),
                    Text('Periode: 12 Maret 2020 - 1 April 2020', style: ThemeTextStyle.ralewayRegular.apply(color: Colors.black, fontSizeDelta: 12.ssp),),
                    SizedBox(height: 30.h,),
                    Text('Bonus aksesoris hampir selalu ada di setiap pembelian kendaraan bermotor. Untuk pembelian unit mobil,'
                        ' misalnya, tenaga penjual biasanya menawarkan aksesori jok kendaraan, sarung mobil, hingga karpet mobil.'
                        ' Sementara untuk unit motor, bonus aksesoris yang ditawarkan seperti hadiah helm dan tool kit seperti obeng'
                        ' hingga kunci busi. Ada juga beberapa aksesoris resmi yang ikut ditawarkan sebagai bonus, diantaranya adalah'
                        ' rear spoiler, muffler cutter, shark pin antenna, door sill guard, garnish krom, side body molding,'
                        ' dan lain sebagainya. Beli mobil anda sekrang di dealer kami dan dapatkan aksesori gratis. Syarat'
                        ' dan ketentuan berlaku',
                      style: TextStyle(
                        height: 1.25,
                        fontFamily: Fonts.raleway,
                        fontWeight: Fonts.ralewayRegular,
                        fontSize: 12.ssp,
                      ),),
                    SizedBox(height: 20.h,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
