 
import 'package:dio/dio.dart';

import 'end_point.dart';

class DioHelper {
  static late Dio dio;

  static init()async {
    dio =Dio(
      
      BaseOptions(
       
        baseUrl: EndPoint.baseUrl, ),
        
    );
 dio.options.connectTimeout = const Duration(seconds: 25);  // وقت انتظار الاتصال بالسيرفر 
 dio.options.receiveTimeout = const Duration(seconds: 25);  // وقت انتظار استلام البيانات من السيرفر 
  }






  
 

  Future  post({
  required String endPoint,
  Map<String, dynamic>? queryParameters,
  dynamic data,
  String? token,
  bool isFormData = false,
  ProgressCallback? progressCallback,
}) async {
  try {
   
 
    Response response = await dio.post(
    endPoint,
      options: Options(
        headers: {
          "token": "FOODAPI $token",
           if (isFormData)
              'Content-Type': 'multipart/form-data'
           else
             'Content-Type': 'application/json',
        },
        
      ) ,
      
      data: data,
      queryParameters: queryParameters,
      onReceiveProgress: progressCallback,
      
    );
    return response.data;
  } catch (e) {
    rethrow;
  }
}








 









 


}
