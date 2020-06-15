import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/widgets/measure_size.dart';
import 'package:dribbble_clone/view/high_resolution/widgets/bottom_sheet_high_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share/share.dart';
import 'stores/high_res_stores.dart';

class HighResolutionView extends StatefulWidget {

  HighResolutionView({Key key, @required this.produkShareLink, @required this.produkDescription, @required this.produkImage, @required this.produkName}): super(key: key);

  final String produkName;
  final String produkImage;
  final String produkDescription;
  final String produkShareLink;

  @override
  _HighResolutionViewState createState() => _HighResolutionViewState();
}

class _HighResolutionViewState extends State<HighResolutionView> {

  var _highResStores = locator<HighResStores>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      _highResStores.resetBottomSheetPosition();
    });
  }

  _share() {
    Share.share(widget.produkShareLink);
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
              Image.asset('assets/images/ic_download.png', width: 24.w, height: 24.h, color: Colors.white,),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: size.width, height: size.height,
              child: PhotoView(imageProvider: NetworkImage(widget.produkImage)),
            ),
            AnimatedPositioned(
              bottom: _highResStores.notificationPosition.dy, left: 0, right: 0,
              duration: Duration(milliseconds: _highResStores.onPanUpdate ? 0 : 200),
              child: GestureDetector(
                onPanUpdate: (details) {
                  _highResStores.changePanUpdate(true);
                  _highResStores.changeNotificationPosition(Offset(
                      _highResStores.notificationPosition.dx - details.delta.dx,
                      _highResStores.notificationPosition.dy - details.delta.dy
                  ));
                },
                onPanEnd: (details) {
                  _highResStores.changePanUpdate(false);
                  double vertical = _highResStores.notificationPosition.dy;
                  _highResStores.changeNotificationPosition(Offset(0, vertical > 0 || vertical > -(_highResStores.notificationHeight/2) ? 0 : -(_highResStores.notificationHeight - 20.h - 16.h - _highResStores.titleHeight)));
                },
                child: MeasureSize(
                  onChange: (Size size) => _highResStores.changeNotificationHeight(size.height),
                  child: BottomSheetHighRes(
                    produkName: widget.produkName,
                    produkDescription: widget.produkDescription,
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
