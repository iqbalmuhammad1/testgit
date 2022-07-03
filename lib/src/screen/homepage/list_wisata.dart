import 'package:flutter/material.dart';
import 'package:wisataind/src/logic/list_wisata_bloc.dart';
import 'package:wisataind/src/model/service_model.dart';
import 'package:wisataind/src/model/wisata_model/list_wisata_model.dart';
import 'package:wisataind/src/widgets/error_page.dart';
import 'package:wisataind/src/widgets/unknown_page.dart';
import 'package:wisataind/src/widgets/widget_list_wisata.dart';



class ListWisata extends StatelessWidget {
  final listWisataBloc = ListWisataBloc();
  @override
  Widget build(BuildContext context) {
    listWisataBloc.getListWisata();
    return StreamBuilder<ServiceModel<ListWisataModel>>(
      stream: listWisataBloc.listWisataStream,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          switch(snapshot.data.status){
            case Status.COMPLETED:
              return WidgetListWisata(listWisata: snapshot.data.data.data,);
              break;
            case Status.ERROR:
              return UnknownPage(snapshot.data.message);
              break;
            case Status.DIOERROR:
              return ErrorPage();
              break;
          }
        }
        return Center(child: CircularProgressIndicator());
      }
    );
  }
}
