import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
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
        Stack(
          children: <Widget>[
            PlaceholderNetworkImage(
                imageFit: BoxFit.cover,
                url: _berandaStores?.merchantDetailData?.merchant?.logo ?? '',
                size: Size(size.width, size.height),
                borderRadius: 0
            ),
            Container(
              width: size.width, height: size.height,
              color: Colors.black.withOpacity(0.3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _nextScreen(context),
                      child: Icon(Icons.clear, color: Colors.white, size: 20,),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 38.h,),
                          Text('Selamat Datang\ndi ${_berandaStores?.merchantDetailData?.merchant?.name ?? '-'}!', style: ThemeTextStyle.ralewayBold.apply(fontSizeDelta: 24.ssp, color: Colors.white),),
                          SizedBox(height: 10.h,),
                          Text(_berandaStores?.merchantDetailData?.merchant?.description ?? '', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 12.ssp, color: Colors.white),),
                          SizedBox(height: 20.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _nextScreen(context),
                      child: Text('NEXT', style: ThemeTextStyle.ralewayBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
