import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/item_product_shimmer.dart';
import 'package:dribbble_clone/view/home/widgets/list_produk_item.dart';
import 'package:dribbble_clone/view/search/widgets/list_search_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'stores/search_stores.dart';

class SearchView extends StatefulWidget {

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var _searchFocus = FocusNode();
  var _searchController = TextEditingController();
  var _searchStores = locator<SearchStores>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      _searchStores.clearListProduk();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColor.primary,
          title: Row(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset('assets/images/ic_arrow-left.png', width: 24.w, height: 24.h, color: Colors.white,),
                  onTap: () => Navigator.pop(context)
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => _searchStores.setSearch(value.trim() ?? ''),
                  focusNode: _searchFocus,
                  autofocus: true,
                  onEditingComplete: () {
                    if (_searchStores.search == '') {
                      Fluttertoast.showToast(
                          msg: 'Masukan kata terlebih dahulu.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black.withOpacity(0.4),
                          textColor: Colors.white,
                          fontSize: 16.ssp
                      );
                    } else {
                      _searchStores.getProduk(true);
                      _searchFocus.unfocus();
                    }
                  },
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  style: ThemeTextStyle.ralewaySemiBold.apply(fontSizeDelta: 16.ssp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Cari Produk...',
                    hintStyle: ThemeTextStyle.ralewaySemiBold.apply(fontSizeDelta: 16.ssp, color: Color(0xFFE46468)),
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              _searchStores.search.length == 0 ?
              Container() :
              GestureDetector(
                onTap: () {
                  _searchController.clear();
                  _searchStores.setSearch('');
                },
                child: Image.asset('assets/images/ic_clear.png', width: 24.w, height: 24.h, color: Colors.white,),
              )
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: size.width, height: size.height,
              color: ThemeColor.primary,
            ),
            Parent(
              style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..minHeight(size.height - 56)..width(size.width)..padding(horizontal: 16.w, top: 3),
              child: !_searchStores.loadingProduk && _searchStores.listProduk.length == 0 && !_searchStores.alreadySearch ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/search_engine 1.png'),
                  SizedBox(height: 10.h,),
                  Text('Mulai cari produk yang Anda inginkan di sini', style: ThemeTextStyle.ralewayMedium.apply(color: Colors.black, fontSizeDelta: 12.ssp),)
                ],
              ) :
              _searchStores.loadingProduk && _searchStores.listProduk.length == 0 ?
              ListSearchShimmer() :
              _searchStores.listProduk.length == 0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/search_engine 1.png'),
                  SizedBox(height: 10.h,),
                  Text('Produk yang anda cari tidak ditemukan.', style: ThemeTextStyle.ralewayMedium.apply(color: Colors.black, fontSizeDelta: 12.ssp),)
                ],
              ) :
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30.h,),
                    Row(
                      children: <Widget>[
                        Image.asset('assets/images/ic_grid_red.png', width: 24.w, height: 24.h,),
                        SizedBox(width: 10.w,),
                        Text('Produk', style: ThemeTextStyle.ralewaySemiBold.apply(color: ThemeColor.primary, fontSizeDelta: 16.ssp),)
                      ],
                    ),
                    SizedBox(height: 8.h,),
                    Text('Ditemukan ${_searchStores.totalProduk} hasil untuk "${_searchStores.shownQuery}"'),
                    StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      itemCount: _searchStores.produkPage > _searchStores.lastProdukPage ? _searchStores.listProduk.length : _searchStores.listProduk.length + 2,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= _searchStores.listProduk.length) {
                          return ItemProductShimmer(index: index);
                        } else {
                          return ListProdukItem(
                            item: _searchStores.listProduk[index],
                            isTop: index <= 1,
                            isBot: index >= _searchStores.listProduk.length - 2,
                          );
                        }
                      },
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
