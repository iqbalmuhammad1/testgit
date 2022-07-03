

import 'package:dio/dio.dart';
import 'package:wisataind/locator.dart';
import 'package:wisataind/src/services/service.dart';
import 'package:wisataind/src/model/wisata_model/list_wisata_model.dart';

class WisataRepository{
  Service service = locator<Service>();

  Future<ListWisataModel> getListPlace() async {
    final Response response = await service.getListWisata();
    return ListWisataModel.fromJson(response.data);
  }
}