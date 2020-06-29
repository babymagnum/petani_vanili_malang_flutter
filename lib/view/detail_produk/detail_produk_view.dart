import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/page_indicator.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/product/item_product.dart';
import 'package:dribbble_clone/networking/request/submit_lead_request.dart';
import 'package:dribbble_clone/view/detail_produk/widgets/list_video_youtube_item.dart';
import 'package:dribbble_clone/view/high_resolution/high_resolution_view.dart';
import 'package:dribbble_clone/view/home/widgets/list_produk_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'stores/detail_produk_stores.dart';
import '../beranda/stores/beranda_stores.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class DetailProdukView extends StatefulWidget {

  DetailProdukView({Key key, @required this.itemProduct}): super(key: key);

  final ItemProduct itemProduct;

  @override
  _DetailProdukViewState createState() => _DetailProdukViewState();
}

class _DetailProdukViewState extends State<DetailProdukView> {

  var _berandaStores = locator<BerandaStores>();
  var _detailProdukStores = locator<DetailProdukStores>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _detailProdukStores.submitLeads(SubmitLeadsRequest('${widget.itemProduct.id}', 'page', '${_berandaStores.merchantDetailData.merchant.id}'));
    });
  }

  List<Widget> pageIndicators() {
    List<Widget> listWidget = List();

    for(int i=0; i<widget.itemProduct.images.length; i++) {
      listWidget.add(PageIndicator(
        isSelected: _detailProdukStores.imageIndex == i,
        //color: _detailProdukStores.imageIndex == i ? ThemeColor.orange : Colors.white,
        color: Colors.white,
        isFirst: i == 0,
        isLast: i == widget.itemProduct.images.length -1,
      ));
    }

    return listWidget;
  }

  String _shareLink() {
    return 'https://plis.id/product/${widget.itemProduct.name.toLowerCase().replaceAll(' ', '-')}/${widget.itemProduct.id}';
  }

  _share() {
    Share.share(_shareLink());
  }

  _toHighResImage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => HighResolutionView(
      produkImage: widget.itemProduct.images[_detailProdukStores.imageIndex],
      produkDescription: widget.itemProduct.description,
      produkName: widget.itemProduct.name,
      produkShareLink: _shareLink(),))
    );
  }

  @override
  void dispose() {
    _detailProdukStores.resetData();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        appBar: _detailProdukStores.fullScreen ? null : AppBar(
          backgroundColor: ThemeColor.primary,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset('assets/images/ic_arrow-left.png', width: 24.w, height: 24.h, color: Colors.white,),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => _share(),
                child: Image.asset('assets/images/ic_share.png', width: 24.w, height: 24.h, color: Colors.white,),
              ),
              SizedBox(width: 25.w,),
              GestureDetector(
                onTap: () => _toHighResImage(context),
                child: Image.asset('assets/images/ic_high_res.png', width: 24.w, height: 24.h, color: Colors.white,),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height, width: size.width, color: ThemeColor.primary,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60.h,),
                  Container(
                    width: size.width, height: 190.h,
                    child: PageView.builder(
                      itemCount: widget.itemProduct.images.length,
                      onPageChanged: (value) => _detailProdukStores.setImageIndex(value),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () => _toHighResImage(context),
                        child: PlaceholderNetworkImage(
                            imageFit: BoxFit.contain,
                            url: widget.itemProduct.images[index],
                            size: Size(size.width, 190.h),
                            borderRadius: 0
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Observer(builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pageIndicators(),
                    )),
                  ),
                  SizedBox(height: 25.h,),
                  Parent(
                    style: ParentStyle()..background.color(Colors.white)..borderRadius(topLeft: 32, topRight: 32)..width(size.width)..minHeight(size.height - 366.h - MediaQuery.of(context).padding.top),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 38.h,),
                              Text(widget.itemProduct.name, style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 24.ssp),),
                              SizedBox(height: 8.h,),
                              Text(TextUtil.toRupiah(widget.itemProduct.min_price), style: ThemeTextStyle.ralewayMedium.apply(color: Colors.black, fontSizeDelta: 14.ssp),),
                              SizedBox(height: 32.h,),
                              Text('Deskripsi Produk', style: ThemeTextStyle.ralewaySemiBold.apply(color: ThemeColor.primary, fontSizeDelta: 14.ssp),),
                              SizedBox(height: 16.h,),
                              Text(widget.itemProduct.description,
                                  maxLines: 10, style: ThemeTextStyle.ralewayRegular.apply(fontSizeDelta: 12.ssp, color: Colors.black)),
                              SizedBox(height: 35.h,),
                              Text('Video Produk', style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 18.ssp),),
                            ],
                          ),
                        ),
//                        SizedBox(height: 16.h,),
//                        Container(
//                          width: size.width, height: _detailProdukStores.fullScreen ? size.height : 120.h,
//                          child: ListView.builder(
//                            scrollDirection: Axis.horizontal,
//                            itemCount: _detailProdukStores.listVideo.length,
//                            itemBuilder: (_, index) => ListVideoItem(
//                                key: Key(index.toString()),
//                                isFirst: index == 0,
//                                item: _detailProdukStores.listVideo[index],
//                                index: index
//                            ),
//                          ),
//                        ),
                        SizedBox(height: 16.h,),
                        Container(
                          width: size.width, height: _detailProdukStores.fullScreen ? size.height : 120.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.itemProduct.videos.length,
                            itemBuilder: (_, index) => ListVideoYoutubeItem(
                                key: Key(index.toString()),
                                isFirst: index == 0,
                                item: widget.itemProduct.videos[index],
                                index: index
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text('Produk Terkait', style: ThemeTextStyle.ralewayBold.apply(color: ThemeColor.primary, fontSizeDelta: 18.ssp),),
                        ),
                        SizedBox(height: 16.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            itemCount: _berandaStores.listProduk.length,
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
                        SizedBox(height: 16.h,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            _detailProdukStores.fullScreen ?
            Container() :
            Stack(
              children: <Widget>[
                AnimatedPositioned(
                  bottom: 36.w + (_detailProdukStores.showMenu ? (36 * 3) + (16 * 3) : 0).toDouble().w, right: 26.w,
                  duration: Duration(milliseconds: 200),
                  child: Builder(
                    builder: (context) => Parent(
                      gesture: Gestures()..onTap(() async {
                        final phone = widget.itemProduct?.merchant?.phone ?? 0;
                        if (phone == 0) {
                          Fluttertoast.showToast(msg: 'Merchant ini belum mendaftarkan nomer telepon.');
                        } else {
                          if (_detailProdukStores.productDetailData == null) await _detailProdukStores.getProductDetailData(context, '${widget.itemProduct.id}');
                          _detailProdukStores.submitLeads(SubmitLeadsRequest('${widget.itemProduct.id}', 'phone', '${_detailProdukStores.productDetailData.merchant.user_id}'));
                          UrlLauncher.launch('tel:${widget?.itemProduct?.merchant?.phone ?? 0}');
                        }
                      }),
                      style: ParentStyle()..width(36.w)..height(36.w)..borderRadius(all: 1000)..background.color(Color(0xFF4B6CAC))..ripple(true),
                      child: Center(
                        child: Image.asset('assets/images/ic_phone.png', width: 16.w, height: 16.w,),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  bottom: 36.w + (_detailProdukStores.showMenu ? (36 * 2) + (16 * 2) : 0).toDouble().w, right: 26.w,
                  duration: Duration(milliseconds: 200),
                  child: Builder(
                    builder: (context) => Parent(
                      gesture: Gestures()..onTap(() async {
                        final email = widget.itemProduct?.merchant?.email ?? '';
                        if (email == '') {
                          Fluttertoast.showToast(msg: 'Merchant ini belum mendaftarkan alamat email.');
                        } else {
                          if (_detailProdukStores.productDetailData == null) await _detailProdukStores.getProductDetailData(context, '${widget.itemProduct.id}');
                          _detailProdukStores.submitLeads(SubmitLeadsRequest('${widget.itemProduct.id}', 'email', '${_detailProdukStores.productDetailData.merchant.user_id}'));
                          UrlLauncher.launch('mailto:${widget.itemProduct?.merchant?.email ?? ''}');
                        }
                      }),
                      style: ParentStyle()..width(36.w)..height(36.w)..borderRadius(all: 1000)..background.color(Color(0xFFF12E2E))..ripple(true),
                      child: Center(
                        child: Image.asset('assets/images/ic_mail_detail.png', width: 16.w, height: 16.w,),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  bottom: 36.w + (_detailProdukStores.showMenu ? 36 + 16 : 0).toDouble().w, right: 26.w,
                  duration: Duration(milliseconds: 200),
                  child: Builder(
                    builder: (context) => Parent(
                      gesture: Gestures()..onTap(() async {
                        final whatsapp = widget.itemProduct?.merchant?.whatsapp ?? '';
                        if (whatsapp == '') {
                          Fluttertoast.showToast(msg: 'Merchant ini belum mendaftarkan nomer WhatsApp.');
                        } else {
                          if (_detailProdukStores.productDetailData == null) await _detailProdukStores.getProductDetailData(context, '${widget.itemProduct.id}');
                          _detailProdukStores.submitLeads(SubmitLeadsRequest('${widget.itemProduct.id}', 'phone', '${_detailProdukStores.productDetailData.merchant.user_id}'));
                          FlutterOpenWhatsapp.sendSingleMessage(widget.itemProduct?.merchant?.whatsapp, "Hello...");
                        }
                      }),
                      style: ParentStyle()..width(36.w)..height(36.w)..borderRadius(all: 1000)..background.color(Color(0xFF5AAC4B))..ripple(true),
                      child: Center(
                        child: Image.asset('assets/images/ic_message_circle.png', width: 16.w, height: 16.w,),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.w, right: 16.w,
                  child: Parent(
                    gesture: Gestures()..onTap(() => _detailProdukStores.setShowMenu(!_detailProdukStores.showMenu)),
                    style: ParentStyle()..width(56.w)..height(56.w)..borderRadius(all: 1000)..background.color(Color(0xFFF97700))..ripple(true),
                    child: Center(
                      child: Image.asset(_detailProdukStores.showMenu ? 'assets/images/ic_clear.png' : 'assets/images/ic_user.png', width: 24.w, height: 24.w,),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
