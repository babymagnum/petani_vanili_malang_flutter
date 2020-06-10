import 'package:division/division.dart';
import 'package:dribbble_clone/core/widgets/item_product_shimmer.dart';
import 'package:dribbble_clone/view/search/widgets/list_search_shimmer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/produk_stores.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/view/home/widgets/list_produk_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProdukView extends StatefulWidget {

  @override
  _ProdukViewState createState() => _ProdukViewState();
}

class _ProdukViewState extends State<ProdukView> {

  var _produkStores = locator<ProdukStores>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      if (_produkStores.listProduk.length == 0) _produkStores.getProduk(true, '');
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
          Parent(
            style: ParentStyle()..borderRadius(topLeft: 32, topRight: 32)..background.color(Colors.white)..width(size.width)..padding(horizontal: 16.w, top: 3),
            child: _produkStores.loadingProduk && _produkStores.listProduk.length == 0 ?
            ListSearchShimmer() :
            NotificationListener(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_produkStores.loadingProduk) _produkStores.getProduk(false, '');
                return;
              },
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: _produkStores.produkPage > _produkStores.lastProdukPage ? _produkStores.listProduk.length : _produkStores.listProduk.length + 2,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= _produkStores.listProduk.length) {
                    return ItemProductShimmer(index: index);
                  } else {
                    return ListProdukItem(
                      item: _produkStores.listProduk[index],
                      isTop: index <= 1,
                      isBot: index >= _produkStores.listProduk.length - 2,
                    );
                  }
                },
                staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
