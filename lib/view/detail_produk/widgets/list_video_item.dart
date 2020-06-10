import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:dribbble_clone/model/video_produk_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../stores/detail_produk_stores.dart';

class ListVideoItem extends StatefulWidget {

  ListVideoItem({Key key, @required this.isFirst, @required this.item, @required this.index}): super(key: key);

  final bool isFirst;
  final VideoProdukModel item;
  final int index;

  @override
  _ListVideoItemState createState() => _ListVideoItemState();
}

class _ListVideoItemState extends State<ListVideoItem> with SingleTickerProviderStateMixin {

  VideoPlayerController _controller;
  AnimationController _playPauseController;
  var _detailProdukStores = locator<DetailProdukStores>();

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.item.url)..initialize().then((_) {
      setState(() {});
    });

    _playPauseController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  _playPause() {
    if (widget.item.isPlaying) {
      _playPauseController.reverse();
      _controller.pause();
    } else {
      _playPauseController.forward();
      _controller.play();
    }

    _detailProdukStores.updateListVideo(widget.index);
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: widget.isFirst ? 16.w : 0, right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: <Widget>[
            _controller.value.initialized ?
            Container(
              width: size.width * 0.5, height: 120.h,
              child: VideoPlayer(_controller),
            ) :
            PlaceholderContainerShimmer(
              size: Size(size.width * 0.5, 120.h),
              borderRadius: 10,
            ),
            Positioned(
              left: 0, right: 0, bottom: 0, top: 0,
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () => _playPause(),
                    child: Parent(
                      style: ParentStyle()..background.color(Colors.white.withOpacity(0.5))..width(35.h)..height(35.h)..borderRadius(all: 1000),
                      child: Center(
                        child: AnimatedIcon(icon: AnimatedIcons.play_pause, size: 24.h, progress: _playPauseController, color: ThemeColor.primary.withOpacity(0.5),),
                      ),
                    ),
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
