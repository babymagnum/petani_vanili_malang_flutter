import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/view/beranda/widgets/list_produk_beranda_shimmer.dart';
import 'package:dribbble_clone/view/beranda/widgets/list_promo_beranda_shimmer.dart';
import 'package:dribbble_clone/view/home/widgets/list_produk_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'stores/beranda_stores.dart';
import '../home/stores/home_stores.dart';

class BerandaView extends StatefulWidget {
  @override
  _BerandaViewState createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {

  var _berandaStores = locator<BerandaStores>();
  var _homeStores = locator<HomeStores>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      if (_berandaStores.merchantDetailData == null) _berandaStores.getMerchantDetailData();
      if (_berandaStores.listProduk.length == 0) _berandaStores.getProduk();
      if (_berandaStores.listPromo.length == 0) _berandaStores.getPromo();
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Stack(
        children: <Widget>[
          Container(
            width: size.width, height: size.height,
            color: ThemeColor.primary,
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: <Widget>[
                    PlaceholderNetworkImage(
                      url: _berandaStores?.merchantDetailData?.merchant?.logo ?? '',
                      size: Size(36.h, 36.h),
                      borderRadius: 1000,
                      imageFit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Selamat datang di', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 14.ssp, color: Colors.white),),
                        Text(_berandaStores?.merchantDetailData?.merchant?.name ?? '-', style: ThemeTextStyle.ralewayBold.apply(fontSizeDelta: 22.ssp, color: Colors.white),),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
              Expanded(
                child: Parent(
                  style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..width(size.width),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: <Widget>[
                              Image.asset('assets/images/ic_sun.png', color: ThemeColor.primary, width: 15.h, height: 15.h,),
                              SizedBox(width: 9.w,),
                              Text('Promo', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 14.ssp, color: ThemeColor.primary),),
                              Spacer(),
                              GestureDetector(
                                onTap: () => _homeStores.setDrawerIndex(4),
                                child: Text('Lihat Semua', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 12.ssp, color: Color(0xFFEB8F92)),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Container(
                          width: size.width, height: 120,
                          child: _berandaStores.loadingPromo ?
                          ListPromoBerandaShimmer() :
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _berandaStores.listPromo.length,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(left: index == 0 ? 16.w : 0, right: index == _berandaStores.listPromo.length - 1 ? 16.w : 10.w),
                              child: PlaceholderNetworkImage(
                                url: _berandaStores.listPromo[index].image,
                                size: Size((size.width * 0.7).toInt().toDouble() - 10, 120),
                                borderRadius: 5,
                                imageFit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: <Widget>[
                              Image.asset('assets/images/ic_grid_red.png', width: 15.h, height: 15.h,),
                              SizedBox(width: 9.w,),
                              Text('Produk', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 14.ssp, color: ThemeColor.primary),),
                              Spacer(),
                              GestureDetector(
                                onTap: () => _homeStores.setDrawerIndex(1),
                                child: Text('Lihat Semua', style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 12.ssp, color: Color(0xFFEB8F92)),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: _berandaStores.loadingProduk && _berandaStores.listProduk.length == 0 ?
                          ListProdukBerandaShimmer() :
                          _berandaStores.errorProduk ?
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.error, size: 35, color: Colors.black54,),
                                SizedBox(height: 10.h,),
                                RichText(
                                  text: TextSpan(
                                    text: 'Gagal memuat data produk, ',
                                    style: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: -4),
                                    children: [
                                      TextSpan(
                                        text: 'muat ulang?',
                                        recognizer: TapGestureRecognizer()..onTap = () => _berandaStores.getProduk(),
                                        style: ThemeTextStyle.ubuntuR.apply(decoration: TextDecoration.underline, fontSizeDelta: -4),
                                      )
                                    ]
                                  ),
                                )
                              ],
                            ),
                          ) :
                          StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            itemCount: _berandaStores.listProduk.length > 6 ? 6 : _berandaStores.listProduk.length,
                            itemBuilder: (BuildContext context, int index) => ListProdukItem(
                              item: _berandaStores.listProduk[index],
                              isTop: false,
                              isBot: false,
                            ),
                            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 8.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
