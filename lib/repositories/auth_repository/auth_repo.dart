import 'package:dio/dio.dart';

class AuthRepo {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080/auth/users',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers:{
        'Content-Type': 'application/json',
      }
    )
  );

  Future<Map<String, dynamic>> login(String email, String password) async{
    try{
      final response = await _dio.post(
        '/login',
        data:{
          "email": email,
          "password": password
        }
      );
      return response.data;
    } on DioException catch(e){
      throw Exception(e.response?.data['message'] ?? "Login failed");
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async{
    try{
      final response = await _dio.post(
        '/register',
        data:{
          "email": email,
          "password": password
        }
      );
      return response.data;
    } on DioException catch(e){
      throw Exception(e.response?.data['message'] ?? "Register failed");  
    }
  }
}

