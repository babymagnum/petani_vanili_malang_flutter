import 'package:dribbble_clone/model/video_produk_model.dart';
import 'package:mobx/mobx.dart';

part 'detail_produk_stores.g.dart';

class DetailProdukStores = _DetailProdukStores with _$DetailProdukStores;

abstract class _DetailProdukStores with Store {

  @observable
  int imageIndex = 0;

  @observable
  ObservableList<VideoProdukModel> listVideo = ObservableList.of([
    VideoProdukModel('https://xf-xfsdk-doc.oss-cn-shenzhen.aliyuncs.com/iOS/temp/test.mp4', false),
    VideoProdukModel('https://xf-xfsdk-doc.oss-cn-shenzhen.aliyuncs.com/iOS/temp/test.mp4', false),
    VideoProdukModel('https://xf-xfsdk-doc.oss-cn-shenzhen.aliyuncs.com/iOS/temp/test.mp4', false)
  ]);

  @action
  setImageIndex(int value) => imageIndex = value;

  @action
  updateListVideo(int index) {
    var video = listVideo[index];
    video.isPlaying = !video.isPlaying;

    listVideo[index] = video;
  }
}