import 'package:dribbble_clone/main.dart';
import 'package:dribbble_clone/model/merchant_detail/merchant_detail.dart';
import 'package:dribbble_clone/model/product/product.dart';
import 'package:dribbble_clone/model/success/success.dart';
import 'package:dribbble_clone/networking/request/submit_lead_request.dart';
import 'package:dribbble_clone/networking/service/base_service.dart';

class Networking extends BaseService {

  Future<MerchantDetail> getMerchantDetail(String merchantId) async {
    return await get('${MyApp.BASE_API}/api/merchant-detail/$merchantId');
  }

  Future<Product> getMerchantProducts(String merchantId, int page, String keyword) async {
    return await get("${MyApp.BASE_API}/api/products?per_page=10&page=$page&keyword=$keyword&category&unit&level&merchant=$merchantId&province&group&exclude_product_id&order_by=created_at&order=desc");
  }

  Future<Success> submiteLeads(SubmitLeadsRequest body) async {
    return await postFormData('${MyApp.BASE_API}/api/submit-leads', body.getBody());
  }
}