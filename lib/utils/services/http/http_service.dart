import 'package:dio/dio.dart';
import 'package:music_playlist/utils/services/error/exception.dart';

import '../base_url.dart';
import '../error/failure.dart';

class HttpService{
  /// Service
  HttpService();

  Dio _getDio(){
    Dio dio = Dio(BaseOptions(
        baseUrl: BaseUrl.url,
        receiveDataWhenStatusError: true,
        connectTimeout: 60*1000, // 60 seconds
        receiveTimeout: 60*1000,
        sendTimeout: 60*1000
    ),
    );
    // HttpInterceptor(dio);

    return dio;
  }

  Future<void> post({
    required String path,
    required Map<String,dynamic> param,
    required Function preExecute,
    Options? options,
    Map<String,dynamic>? query,
    Function(dynamic data)? onSuccess ,
    Function(dynamic error)? onError,
    Function(dynamic failure)? onFailure
  }) async {
    try {
      Response response = await _getDio().post(path,options: options,queryParameters: query,data: param);
      if(onSuccess != null) onSuccess(response.data);
    } on DioError catch(error){
      if (error.response != null) {
        // print('Dio error!');
        // print('STATUS: ${error.response?.statusCode}');
        // print('DATA: ${error.response?.data}');
        // print('HEADERS: ${error.response?.headers}');
        if(onError != null)
          if(error.response!.data != null) onError(error.response!.data);

      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        if(onFailure != null) onFailure(error.message);
        // print(error.stackTrace);
        // print(error.message);
      }
    }
  }

  Future<dynamic> get({
    required String path,
    Map<String,dynamic>? query,
    Options? options,
  }) async {
    {
      try{
        Response response = await _getDio().get(path,options: options, queryParameters: query);
         return response.data;
      } on DioError catch(error) {
        if (error.response != null) {
          if(error.response!.data != null)
            throw ServerException(error);
      } else {
          // Error due to setting up or sending the request
          // print('Error sending request!');
          throw ServerFailure(error.message);
          // print(error.message);
        }
      }
    }
  }



}