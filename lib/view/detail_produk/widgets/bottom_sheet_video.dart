import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/widgets/placeholder_container_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class BottomSheetVideo extends StatefulWidget {

  BottomSheetVideo({Key key, @required this.onPlayPauseClick, @required this.playPauseController, @required this.videoPlayerController, @required this.videoUrl}): super(key: key);

  final VideoPlayerController videoPlayerController;
  final AnimationController playPauseController;
  final String videoUrl;
  final Function onPlayPauseClick;

  @override
  _BottomSheetVideoState createState() => _BottomSheetVideoState();
}

class _BottomSheetVideoState extends State<BottomSheetVideo> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          width: size.width, height: size.height,
          child: Align(
            alignment: Alignment.center,
            child: widget.videoPlayerController.value.initialized ?
            AspectRatio(
              aspectRatio: widget.videoPlayerController.value.aspectRatio,
              child: VideoPlayer(widget.videoPlayerController),
            ) :
            PlaceholderContainerShimmer(
              size: Size(size.width, size.height),
              borderRadius: 0,
            ),
          ),
        ),
        Positioned(
          top: 26.h + 16.w, right: 16.w,
          child: Parent(
            gesture: Gestures()..onTap(() => Navigator.pop(context)),
            style: ParentStyle()..background.color(Colors.black.withOpacity(0.2))..width(35.w)..height(35.w)..borderRadius(all: 1000),
            child: Center(
              child: Icon(Icons.fullscreen_exit, size: 24.w, color: Colors.white,),
            ),
          ),
        ),
        Center(
          child: Parent(
            gesture: Gestures()..onTap(widget.onPlayPauseClick),
            style: ParentStyle()..background.color(Colors.white.withOpacity(0.5))..width(35.h)..height(35.h)..borderRadius(all: 1000),
            child: Center(
              child: AnimatedIcon(icon: AnimatedIcons.play_pause, size: 24.h, progress: widget.playPauseController, color: ThemeColor.primary.withOpacity(0.5),),
            ),
          ),
        )
      ],
    );
  }
}
