import 'package:rxdart/rxdart.dart';
import 'package:wisataind/locator.dart';
import 'package:wisataind/src/model/service_model.dart';
import 'package:wisataind/src/services/exception.dart';
import 'package:wisataind/src/model/wisata_model/list_wisata_model.dart';
import 'package:wisataind/src/repository/wisata_repository.dart';

class ListWisataBloc{

  ListWisataBloc(){
    getListWisata();
  }
  final wisataRepository = locator<WisataRepository>();

  final listWisata = PublishSubject<ServiceModel<ListWisataModel>>();

  Stream<ServiceModel<ListWisataModel>> get listWisataStream => listWisata.stream;

  getListWisata() async{
    try{
      var listPlace = await wisataRepository.getListPlace();
      listWisata.sink.add(ServiceModel.completed(listPlace));
    }catch(e){

      if(e is ErrorException){
        listWisata.sink.add(ServiceModel.dioError(e));
      }else{
        listWisata.sink.add(ServiceModel.error("Unkown Data"));
      }
    }
  }

  dispose() {
    listWisata.close();
  }
}