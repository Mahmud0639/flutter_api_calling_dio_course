import 'package:dio_crud/models/ResponseInMapModel.dart';
import 'package:dio_crud/models/create_job.dart';
import 'package:dio_crud/models/success_res.dart';
import 'package:dio_crud/models/response_in_list_students.dart';
import 'package:dio_crud/network_manager/dio_helper.dart';

class Repository{

    static final DioHelper dioHelper = DioHelper();


    Future<dynamic> getApi()async{
      var response = await dioHelper.get(url: "https://reqres.in/api/users");
      return response;
    }

    //model type(Map type json)->get
 Future<ResponseInMapModel> getApiMapModel()async{
      var response = await dioHelper.get(url: "https://touhidapps.com/api/demo/jsondemoapi.php?option=2");
      return ResponseInMapModel.fromJson(response);
    }

    //map type json ->post request
    Future<CreateJob> postApi(Object reqBody)async{
      var response = await dioHelper.post(url: "",requestBody: reqBody);
      return CreateJob.fromJson(response);
    }

    //MAP type json for SuccessRes ->Post request
    Future<SuccessRes> postForCreateStudents(Object reqBody)async{
      var response = await dioHelper.post(url: "http://192.168.0.106/ourapi/v1/students.php",requestBody: reqBody);
      return SuccessRes.fromJson(response);
    }

    //File upload
    Future<SuccessRes> fileUpload(Object reqBody)async{
      var response = await dioHelper.uploadApi(url: "http://192.168.0.106/ourapi/v1/uploads.php", requestBody: reqBody);
      return SuccessRes.fromJson(response);
    }

  //model type(List type json)
 Future<List<ResponseInListStudents>> getApiListModel()async{
      var response = await dioHelper.get(url: "http://192.168.0.106/ourapi/v1/students.php");
      return List<ResponseInListStudents>.from(response.map((e)=>ResponseInListStudents.fromJson(e)));
    }


   Future<dynamic> postApiDynamic(Object reqModel)async{
       var response = await dioHelper.post(url: "https://reqres.in/api/register",requestBody: reqModel);
       return response;
    }
}