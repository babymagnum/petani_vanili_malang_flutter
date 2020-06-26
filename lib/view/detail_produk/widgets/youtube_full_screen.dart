import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/detail_produk/stores/detail_produk_stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeFullScreen extends StatefulWidget {

  YoutubeFullScreen({Key key, @required this.url, @required this.time}): super(key: key);

  final String url;
  final int time;

  @override
  _YoutubeFullScreenState createState() => _YoutubeFullScreenState();
}

class _YoutubeFullScreenState extends State<YoutubeFullScreen> {

  YoutubePlayerController youtubePlayerController;
  var _detailProdukStores = locator<DetailProdukStores>();

  @override
  void initState() {
    super.initState();

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        disableDragSeek: false,
        autoPlay: true,
        mute: false,
        startAt: widget.time
      ),
    )..addListener(() {
      if (youtubePlayerController.value.isReady) {
        setState(() {});
      }

      _detailProdukStores.setFullScreen(youtubePlayerController.value.isFullScreen);
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, youtubePlayerController.value);
        return true;
      },
      child: Observer(
        builder: (_) => Scaffold(
          appBar: _detailProdukStores.fullScreen ? null : AppBar(
            elevation: 0,
            backgroundColor: ThemeColor.primary,
            automaticallyImplyLeading: false,
            title: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context, youtubePlayerController.value.position.inSeconds),
                  child: Icon(Icons.arrow_back, size: 24.w, color: Colors.white,),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Text(youtubePlayerController?.value?.metaData?.title ?? '', style: ThemeTextStyle.ubuntuM.apply(color: Colors.white, fontSizeDelta: 16.ssp),),
                )
              ],
            ),
          ),
          body: Container(
            width: size.width, height: size.height,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: youtubePlayerController,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              builder: (_, player) => Scaffold(
                body: Container(
                  width: size.width, height: size.height,
                  child: player,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
