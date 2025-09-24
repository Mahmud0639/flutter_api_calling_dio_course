import 'package:dio_crud/models/create_job.dart';
import 'package:dio_crud/network_manager/repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text("POST API"),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text("Enter Name"),
                hintText: "Enter name"
              ),
            ),

            SizedBox(
              height: 30,
            ),

            TextField(
              controller: jobController,
              decoration: InputDecoration(
                hintText: "Enter job"
              ),
            ),

            SizedBox(
              height: 30,
            ),

            SizedBox(height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              onPressed: (){
                print("${nameController.text}${"    "}${jobController.text}");

                Map<String,dynamic> userData = {
                  "name": nameController.text,
                  "job": jobController.text
                };

                CreateJob cJob = CreateJob();

                Repository().postApi(userData).then((values){
                  cJob = values;
                  
                  print("value: ${cJob.name}");

                }).onError((error,stackTrace){
                  print("The Error is: ${error.toString()}");
                });

              },
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white
                ),
              )),
            )
        ],
      ),),
    );
  }
}
