import 'dart:io';
import 'package:dribbble_clone/view/detail_produk/widgets/youtube_full_screen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/video_produk_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListVideoYoutubeItem extends StatefulWidget {

  ListVideoYoutubeItem({Key key, @required this.isFirst, @required this.item, @required this.index}): super(key: key);

  final bool isFirst;
  final VideoProdukModel item;
  final int index;

  @override
  _ListVideoYoutubeItemState createState() => _ListVideoYoutubeItemState();
}

class _ListVideoYoutubeItemState extends State<ListVideoYoutubeItem> with SingleTickerProviderStateMixin {
  YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();

    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.item.url),
      flags: YoutubePlayerFlags(
          disableDragSeek: true,
          autoPlay: false,
          mute: false
      ),
    );
  }

  @override
  void deactivate() {
    _youtubePlayerController.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();

    super.dispose();
  }

  _launchURL() async {
    if (Platform.isIOS) {
      if (await UrlLauncher.canLaunch(widget.item.url)) {
        await UrlLauncher.launch(widget.item.url, forceSafariVC: false);
      } else {
        if (await UrlLauncher.canLaunch(widget.item.url)) {
          await UrlLauncher.launch(widget.item.url);
        } else {
          throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
        }
      }
    } else {
      var url = widget.item.url;
      if (await UrlLauncher.canLaunch(url)) {
        await UrlLauncher.launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      style: ParentStyle()..margin(left: widget.isFirst ? 16.w : 0, right: 16.w),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: size.width * 0.5, height: 120.h,
            child: YoutubePlayer(
              bottomActions: <Widget>[
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    _youtubePlayerController.pause();
                    YoutubePlayerValue result = await Navigator.push(context, MaterialPageRoute(builder: (_) => YoutubeFullScreen(url: widget.item.url, time: _youtubePlayerController.value.position.inSeconds)));
                    print('result from detail $result');
                    _youtubePlayerController.seekTo(Duration(seconds: result.position.inSeconds));
                    if (result.isPlaying) {
                      _youtubePlayerController.play();
                    } else {
                      _youtubePlayerController.pause();
                    }
                  },
                  child: Icon(Icons.fullscreen, size: 20, color: Colors.white,),
                )
              ],
              topActions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Parent(
                      gesture: Gestures()..onTap(() => _launchURL()),
                      style: ParentStyle()..padding(all: 5)..background.color(Colors.black.withOpacity(0.4))..ripple(true)..borderRadius(all: 5),
                      child: Text('Watch in YouTube', style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: 10.ssp),),
                    )
                  ],
                )
              ],
              controller: _youtubePlayerController,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
          )
      ),
    );
  }
}
