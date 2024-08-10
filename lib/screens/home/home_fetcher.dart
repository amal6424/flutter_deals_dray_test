import 'package:http/http.dart' as http;

import '../../api_const.dart';
import '../../http_helper.dart';


Future<http.Response> fetchHome(){
  Uri uri = Uri(scheme:"http",host: ApiConst.urlApiMain, path: ApiConst.urlPathHomeItems);
  Future<http.Response> future = HttpHelper.getGetFuture(uri);
  return future;
}