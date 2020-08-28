import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/fonts.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/button_reload.dart';
import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../beranda/stores/beranda_stores.dart';

class OnboardingView extends StatefulWidget {

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  var _berandaStores = locator<BerandaStores>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      if (_berandaStores.merchantDetailData == null) _berandaStores.getMerchantDetailData();
    });
  }

  _nextScreen(BuildContext context) async {
    final preference = await SharedPreferences.getInstance();

    await preference.setBool(Constant.IS_WATCH_ONBOARDING, true);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeView()));
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        body: _berandaStores.loadingMerchant ?
        PlaceholderContainerShimmer(size: Size(size.width, size.height), borderRadius: 0) :
        _berandaStores.errorMerchant ?
        Container(
          width: size.width, height: size.height,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonReload(onTap: () {
                  if (_berandaStores.merchantDetailData == null) _berandaStores.getMerchantDetailData();
                })
              ],
            ),
          ),
        ) :
        Stack(
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
                    onTap: () => _nextScreen(context),
                    child: Image.asset('assets/images/ic_clear.png', width: 24.w, height: 24.h,),
                  ),
                )
              ],
            ),
            Positioned(
              left: 0, right: 0, top: (size.height / 2.25) - 32, bottom: 0,
              child: Parent(
                style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..padding(top: 3),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40.h,),
                        Text('Selamat datang di ${_berandaStores.merchantDetailData.merchant.name}', style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 24.ssp),),
                        SizedBox(height: 30.h,),
                        Text(_berandaStores.merchantDetailData.merchant.description ?? '', style: TextStyle(height: 1.3, fontFamily: Fonts.raleway, fontWeight: Fonts.ralewayRegular, fontSize: 12.ssp,),),
                        SizedBox(height: 20.h,)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
