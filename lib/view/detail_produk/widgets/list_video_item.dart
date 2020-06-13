import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:dribbble_clone/model/video_produk_model.dart';
import 'package:dribbble_clone/view/detail_produk/widgets/bottom_sheet_video.dart';
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

  VideoPlayerController _videoPlayerController;
  AnimationController _playPauseController;
  var _detailProdukStores = locator<DetailProdukStores>();

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BottomSheetVideo(
        videoPlayerController: _videoPlayerController,
        videoUrl: widget.item.url,
        playPauseController: _playPauseController,
        onPlayPauseClick: () => _playPause(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(widget.item.url)..initialize().then((_) => setState(() {}));
    _playPauseController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    _playPauseController.dispose();

    super.dispose();
  }

  _playPause() {
    if (widget.item.isPlaying) {
      _playPauseController.reverse();
      _videoPlayerController.pause();
    } else {
      _playPauseController.forward();
      _videoPlayerController.play();
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
            _videoPlayerController.value.initialized ?
            Container(
              width: size.width * 0.5, height: 120.h,
              child: VideoPlayer(_videoPlayerController),
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
            ),
            Positioned(
              right: 5, top: 5,
              child: Builder(
                builder: (context) => Parent(
                  gesture: Gestures()..onTap(() => _showBottomSheet(context)),
                  style: ParentStyle()..background.color(Colors.black.withOpacity(0.3))..width(17.w)..height(17.w)..borderRadius(all: 3),
                  child: Center(
                    child: Icon(Icons.fullscreen, size: 13.w, color: Colors.white,),
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
