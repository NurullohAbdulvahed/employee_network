import 'dart:convert';

import 'package:http/http.dart';
import 'package:network_hometask/models/http_model.dart';

class Network{
  static String BASE = "dummy.restapiexample.com";

  /* HTTP APIs */

  static String API_GET = "/api/v1/employees";
  static String API_SINGLE_EMPLOYEE = "/api/v1/employee/1";//id
  static String API_CREATE= "/api/v1/create";
  static String API_UPDATE= "/api/v1/update/1"; //id
  static String API_DELETE = "/api/v1/delete/21"; //id


  /*HTTP Requests */

  static Future<String?> GET(String api,Map<String,String> params) async{
    var uri = Uri.http(BASE,api,params);
    var response = await get(uri);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }
  static Future<String?> POST(String api,Map<String,String> params) async{
    var uri = Uri.http(BASE,api);
    var response = await post(uri,body: jsonEncode(params));
    if(response.statusCode == 200|| response.statusCode == 201){
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api,Map<String,String> params) async{
    var uri = Uri.http(BASE,api);
    var response = await put(uri,body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }
  static Future<String?> DELETE(String api,Map<String,String> params) async{
    var uri = Uri.http(BASE,api,params);
    var response = await delete(uri);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }


  /*HTTP params*/


  static Map<String,String> paramsEmpty(){
    Map<String,String> params = {};
    return params;
  }
  static Map<String,String> paramsCreate(Employee employee){
    Map<String,String> params = {};
    params.addAll({
      "name": employee.employee_name!,
      "salary": employee.employee_salary!,
      "age": employee.employee_age!,
    });
    return params;
  }
  static Map<String,String> paramsUpdate(Employee employee){
    Map<String,String> params = {};
    params.addAll({
      "name": employee.employee_name!,
      "salary": employee.employee_salary!,
      "age": employee.employee_age!,
      "id" : employee.id.toString()
    });

    return params;
  }

}