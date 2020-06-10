import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/drawer_item.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view/beranda/stores/beranda_stores.dart';

class CustomDrawer extends StatelessWidget {

  CustomDrawer({Key key, @required this.itemDrawerClick}): super(key: key);

  final Function(int index) itemDrawerClick;

  var _drawerItems = [
    DrawerItem('Home', 'assets/images/ic_home.png'),
    DrawerItem('Produk', 'assets/images/ic_grid.png'),
    DrawerItem('Tentang Kami', 'assets/images/ic_info.png'),
    DrawerItem('Kontak Kami', 'assets/images/ic_phone.png'),
    DrawerItem('Promo', 'assets/images/ic_sun.png'),
  ];
  var _berandaStores = locator<BerandaStores>();

  List<Widget> _items() {
    List<Widget> list = List();

    for (int i=0; i<_drawerItems.length; i++) {
      list.add(
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                drawerKey.currentState.openEndDrawer();

                itemDrawerClick(i);
              },
              child: Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : 16, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Image.asset(_drawerItems[i].icon, width: 20.w, height: 20.h, color: i == 0 ? Colors.white : null,),
                    SizedBox(width: 10.w,),
                    Text(_drawerItems[i].title, style: ThemeTextStyle.ralewayMedium.apply(fontSizeDelta: 16.ssp, color: Colors.white),),
                  ],
                ),
              ),
            ),
          )
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Drawer(
        child: Container(
          color: ThemeColor.primary,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 52.h,),
              PlaceholderNetworkImage(
                url: _berandaStores?.merchantDetailData?.merchant?.logo ?? '',
                size: Size(64.h, 64.h),
                borderRadius: 1000,
                imageFit: BoxFit.cover,
              ),
              SizedBox(height: 16.h,),
              Text(_berandaStores?.merchantDetailData?.merchant?.name ?? '-', style: ThemeTextStyle.ralewayBold.apply(fontSizeDelta: 18.ssp, color: Colors.white),),
              SizedBox(height: 7.h,),
              Text(_berandaStores?.merchantDetailData?.merchant?.address ?? '-', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 12.ssp, color: Colors.white),),
              SizedBox(height: 33.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _items(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
