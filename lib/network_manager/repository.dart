import 'package:dio_crud/models/ResponseInMapModel.dart';
import 'package:dio_crud/models/response_in_list_students.dart';
import 'package:dio_crud/network_manager/dio_helper.dart';

class Repository{

    static final DioHelper dioHelper = DioHelper();


    Future<dynamic> getApi()async{
      var response = await dioHelper.get(url: "https://reqres.in/api/users");
      return response;
    }

    //model type(Map type json)
 Future<ResponseInMapModel> getApiMapModel()async{
      var response = await dioHelper.get(url: "https://touhidapps.com/api/demo/jsondemoapi.php?option=2");
      return ResponseInMapModel.fromJson(response);
    }


  //model type(List type json)
 Future<List<ResponseInListStudents>> getApiListModel()async{
      var response = await dioHelper.get(url: "http://192.168.0.106/ourapi/v1/students.php");
      return List<ResponseInListStudents>.from(response.map((e)=>ResponseInListStudents.fromJson(e)));
    }


   Future<dynamic> postApi(Object reqModel)async{
       var response = await dioHelper.post(url: "https://reqres.in/api/register",requestBody: reqModel);
       return response;
    }
}