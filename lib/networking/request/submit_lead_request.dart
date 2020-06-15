import 'package:dio/dio.dart';

class SubmitLeadsRequest {

  SubmitLeadsRequest(this.products_id, this.lead_type, this.users_id);

  String products_id;
  String lead_type;
  String users_id;

  FormData getBody() {
    return FormData.fromMap({
      'products_id': products_id,
      'lead_type': lead_type,
      'users_id': users_id,
    });
  }
}