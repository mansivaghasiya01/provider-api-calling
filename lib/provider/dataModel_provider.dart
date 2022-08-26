import 'package:flutter/cupertino.dart';
import 'package:provider_api_calling/api_calling/get_api_calling.dart';
import 'package:provider_api_calling/model/data_model.dart';

class DeerProvider extends ChangeNotifier {
  BeersApi beersApi = BeersApi();
  ResponseModel<List<BeerModel>> post = ResponseModel<List<BeerModel>>();
  bool loading = false;

  Future<ResponseModel<List<BeerModel>>> getPostData() async {
    loading = true;
    post = await beersApi.getData();
    loading = false;
    notifyListeners();
    return post;
  }
}


//-----------------old ways------------------//

// bool change = false;
  // bool isloading = false;

  // void updateWidget() {
  //   change = !change;
  //   notifyListeners();
  // }

  // List<DataModel> dataList = [];

  // void updateDataModel(List<DataModel> dataList) {

  // this.dataList = dataList;
  //   notifyListeners();
  // }