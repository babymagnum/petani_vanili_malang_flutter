import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'stores/kontak_kami_stores.dart';

class KontakKamiView extends StatefulWidget {
  @override
  _KontakKamiViewState createState() => _KontakKamiViewState();
}

class _KontakKamiViewState extends State<KontakKamiView> {

  var _kontakKamiStores = locator<KontakKamiStores>();

  @override
  void initState() {
    super.initState();

    _kontakKamiStores.getKontakData();
  }

  List<Widget> _kontakItem() {
    List<Widget> list = List();
    
    _kontakKamiStores.listKontak.forEach((element) {
      list.add(
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Row(
            children: <Widget>[
              Image.asset(element.image, width: 24.w, height: 24.h,),
              SizedBox(width: 24.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(element.title, style: ThemeTextStyle.ralewaySemiBold.apply(color: Colors.black, fontSizeDelta: 12.ssp),),
                    Text(element.description, style: ThemeTextStyle.ralewayRegular.apply(color: Colors.black, fontSizeDelta: 12.ssp),)
                  ],
                ),
              )
            ],
          ),
        )
      );
    });

    return list;
  }
  
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
                Container(
                  height: size.height / 2, width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/kontak_kami.png'),
                      )
                  ),
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
              left: 0, right: 0, top: (size.height / 2) - 32, bottom: 0,
              child: Parent(
                style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..padding(horizontal: 16.w, top: 3),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40.h,),
                      Text('Kontak', style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 24.ssp),),
                      Column(
                        children: _kontakItem(),
                      )
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
