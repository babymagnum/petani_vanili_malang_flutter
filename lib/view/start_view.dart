import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:dribbble_clone/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartView extends StatefulWidget {

  static const routeName = 'StartView';

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final preference = await SharedPreferences.getInstance();
      final isWatchOnboarding = preference.getBool(Constant.IS_WATCH_ONBOARDING) ?? false;

      if (isWatchOnboarding) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeView()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);

    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
