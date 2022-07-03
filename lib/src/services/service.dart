import 'package:dio/dio.dart';
import 'package:wisataind/locator.dart';
import 'package:wisataind/src/services/base_api.dart';

class Service{
  final BaseApi baseApi = locator<BaseApi>();
  Future<Response> getListWisata() async {
    return await baseApi.get('/wisata');
  }
}