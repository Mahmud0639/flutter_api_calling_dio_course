import 'package:dio_crud/models/success_res.dart';
import 'package:dio_crud/network_manager/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentsInfo extends StatefulWidget {
  const StudentsInfo({super.key});

  @override
  State<StudentsInfo> createState() => _StudentsInfoState();
}

class _StudentsInfoState extends State<StudentsInfo> {
  //all controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController creditsController = TextEditingController();
  TextEditingController departmentsController = TextEditingController();
  TextEditingController subjectsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("POST API")),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Mahmud Islam",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 20),
              TextField(controller: nameController,decoration: InputDecoration(hintText: "name here")),
              SizedBox(height: 20),

              TextField(controller: emailController,decoration: InputDecoration(hintText: "email here")),

              SizedBox(height: 20),

              TextField(controller: phoneController,decoration: InputDecoration(hintText: "phone number")),
              SizedBox(height: 20),
              TextField(controller: creditsController,decoration: InputDecoration(hintText: "total credits")),
              SizedBox(height: 20),
              TextField(
                controller: departmentsController,
                decoration: InputDecoration(hintText: "department here"),
              ),
              SizedBox(height: 20),
              TextField(controller: subjectsController,decoration: InputDecoration(hintText: "subjects id")),

              SizedBox(height: 20),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    String name = nameController.text;
                    String email = emailController.text;
                    String phone = phoneController.text;
                    String totalCredits = creditsController.text;
                    String departments = departmentsController.text;
                    String subjectsId = subjectsController.text;

                    int totalCreditsAsInt = int.tryParse(totalCredits.trim())??0;
                    List<int> subjectsIdAsInt = subjectsId.split(',').map((e)=>int.tryParse(e.trim())??0).toList();

                    Map<String,dynamic> studentsMap = {
                      "name": name,
                      "email":email,
                      "phone": phone,
                      "total_credits": totalCreditsAsInt,
                      "dept_name": departments,
                      "subjects": subjectsIdAsInt
                    };


                    SuccessRes cStudents = SuccessRes();

                    Repository().postForCreateStudents(studentsMap).then((values){
                      cStudents = values;
                      
                      print("Response is: ${cStudents.result}");
                      
                    }).onError((error,stackTrace){
                      print("Error : ${error.toString()}");
                    });




                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
