import 'package:http/http.dart' as http;
import 'package:provider_api_calling/model/data_model.dart';

class BeersApi {
  Future<ResponseModel<List<BeerModel>>> getData() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.punkapi.com/v2/beers?page=1"));

      if (response.statusCode == 200) {
        return ResponseModel(
          status: true,
          data: userResponse(response.body),
        );
      } else {
        return ResponseModel(
          status: false,
        );
      }
    } catch (e) {
      ResponseModel(message: e.toString());
    }
    return ResponseModel();
  }
}

//---------------------------------helper class---------------------//

class ResponseModel<T> {
  bool status;
  String message;
  T? data;

  ResponseModel({this.data, this.message = '', this.status = false});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}




  //--------------------------------------old ways----------------------------//
  
  // Future<List<DataModel>> getData() async {
  //   List<DataModel> listData = [];

  //   final response =
  //       await http.get(Uri.parse("https://api.punkapi.com/v2/beers?page=1"));
  //   var data = jsonDecode(response.body);

  //   log("api calling successfully");
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> i in data) {
  //       listData.add(DataModel.fromJson(i));
  //     }
  //     return listData;
  //   }
  //   return listData;
  // }

  // Future<ResponseModel<List<BeerModel>>> getData() async {
  //   // List<DataModel> listData = [];
  //   try {
  //     final response =
  //         await http.get(Uri.parse("https://api.punkapi.com/v2/beers?page=1"));

  //     if (response.statusCode == 200) {
  //       // final item = jsonDecode(response.body);
  //       //result = DataModel.fromJson(item[0]);
  //       return ResponseModel(
  //         status: true,
  //         data: userResponse(response.body),
  //       );
  //       // userResponse(response.body);
  //     } else {
  //       return ResponseModel(
  //         status: false,
  //       );
  //     }
  //   } catch (e) {
  //     ResponseModel(message: e.toString());
  //   }
  //   return ResponseModel();
  // }