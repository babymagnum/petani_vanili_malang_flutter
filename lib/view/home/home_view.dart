import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/beranda/beranda_view.dart';
import 'package:dribbble_clone/view/kontak_kami/kontak_kami_view.dart';
import 'package:dribbble_clone/view/produk/produk_view.dart';
import 'package:dribbble_clone/view/promo/promo_view.dart';
import 'package:dribbble_clone/view/search/search_view.dart';
import 'package:dribbble_clone/view/tentang_kami/tentang_kami_view.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'stores/home_stores.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'home_view';

  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class HomeViewState extends State<HomeView> {

  var _homeStores = locator<HomeStores>();

  final _listDrawer = [
    BerandaView(),
    ProdukView(),
    TentangKamiView(),
    KontakKamiView(),
    PromoView(),
  ];

  _drawerClick(int index, BuildContext context) {
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => TentangKamiView()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => KontakKamiView()));
    } else {
      _homeStores.setDrawerIndex(index);
    }
  }

  Widget _getAppbar() {
    if (_homeStores.drawerIndex == 0) {
      return Row(
        children: <Widget>[
          GestureDetector(
              child: Icon(Icons.menu),
              onTap: () => drawerKey.currentState.openDrawer()
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchView())),
            child: Image.asset('assets/images/ic_search.png', width: 24.w, height: 24.h, color: Colors.white,),
          )
        ],
      );
    } else if (_homeStores.drawerIndex == 1) {
      return Row(
        children: <Widget>[
          GestureDetector(
              child: Icon(Icons.menu),
              onTap: () => drawerKey.currentState.openDrawer()
          ),
          SizedBox(width: 19.w,),
          Text('Produk', style: ThemeTextStyle.ralewaySemiBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
          Spacer(),
          Image.asset('assets/images/filter.png', width: 24.w, height: 24.h, color: Colors.white,),
          SizedBox(width: 25.w,),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchView())),
            child: Image.asset('assets/images/ic_search.png', width: 24.w, height: 24.h, color: Colors.white,),
          )
        ],
      );
    } else if (_homeStores.drawerIndex == 4) {
      return Row(
        children: <Widget>[
          GestureDetector(
              child: Icon(Icons.menu),
              onTap: () => drawerKey.currentState.openDrawer()
          ),
          SizedBox(width: 19.w,),
          Text('Promo', style: ThemeTextStyle.ralewaySemiBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
        ],
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Observer(
      builder: (_) => Scaffold(
        key: drawerKey,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColor.primary,
          title: _getAppbar(),
        ),
        drawer: CustomDrawer(itemDrawerClick: (int index) => _drawerClick(index, context)),
        body: _listDrawer[_homeStores.drawerIndex],
      ),
    );
  }
}