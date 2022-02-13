import 'package:flutter/material.dart';
import 'package:network_hometask/models/http_model.dart';
import 'package:network_hometask/services/http_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static final String  id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String data = "";


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    var employee = Employee(employee_name: "Nurulloh",employee_salary: "2000",employee_age: "20",id: 21);
    apiUpdateEmployee(employee);
  }



  ///GET
void apiGetEmployees(){
  Network.GET(Network.API_GET, Network.paramsEmpty()).then((response) => {
    print(response),
    _showResponse(response!),

  });
}
///GET_SINGLE
void apiSingleEmployee(){
  Network.GET(Network.API_SINGLE_EMPLOYEE, Network.paramsEmpty()).then((response) => {
    print(response),
    _showResponse(response!),

  });
}

///POST
void apiCreateEmployee(Employee employee){
  Network.POST(Network.API_CREATE + employee.id.toString(), Network.paramsCreate(employee)).then((response) => {
    print(response),
    _showResponse(response!),

  });
}

///PUT
void apiUpdateEmployee(Employee employee){
  Network.PUT(Network.API_UPDATE, Network.paramsUpdate(employee)).then((response) => {
    print(response),
    _showResponse(response!),

  });
}
void _apiEmployeeDelete(Employee employee) {
  Network.DELETE(Network.API_DELETE + employee.id.toString(), Network.paramsEmpty()).then((response) => {
    print(response),
    _showResponse(response!)
  });
}
 void _showResponse(String response){
  setState(() {
    data = response;
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(data != null ? data: "No Data",style: TextStyle(color: Colors.black),),
          ),
        ),
      ),
    );
  }
}