


import 'package:dio/dio.dart';

class ApiService
{
   final Dio dio ;

  ApiService(this.dio);

  final String _baseUrl = 'https://openlibrary.org/search.json?';


  Future<Map<String , dynamic >> get({required String endPoint}) async {

    Response response = await dio.get('$_baseUrl$endPoint') ;
    return response.data ;
  }
}