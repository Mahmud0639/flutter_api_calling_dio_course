import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_crud/network_manager/repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickPage extends StatefulWidget {
  const ImagePickPage({super.key});

  @override
  State<ImagePickPage> createState() => _ImagePickPageState();
}

class _ImagePickPageState extends State<ImagePickPage> {

  File? selectedImg;
  String? fileName;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text("Multipart Api"),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(20),child: Column(
        children: [
          GestureDetector(
            onTap: ()async{
              ImagePicker imgPicker = ImagePicker();
              final XFile? image = await imgPicker.pickImage(source: ImageSource.gallery,imageQuality: 70);
              if(image != null){
                selectedImg = File(image.path);
                fileName = image.name;

                print(selectedImg!.path);
              }
              setState(() {

              });
            },

            child: selectedImg== null?Container(
                height: 250,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)
                ),
              child: Text("Select Image"),
            ):Container(
              height: 250,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(fit: BoxFit.cover,image: FileImage(selectedImg!))
              ),

            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: ()async{
              if(selectedImg != null){
                print("I am from elevated button"+selectedImg!.path);
                setState(() {
                  isLoading = true;
                });
                FormData formData = FormData.fromMap({
                  'my_file': await MultipartFile.fromFile(selectedImg!.path,filename: fileName),
                  'title': 'Vuna Khichuri',
                  'description': 'This is from my flutter app.'
                });

                Repository().fileUpload(formData).then((value){
                  print("The result: ${value.result}");
                }).onError((error,stackTrace){
                  print("Error: ${error.toString()}");
                });

                setState(() {
                  isLoading = false;
                });
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select image from your device")));
              }






            }, child: isLoading?CircularProgressIndicator(): Text("Upload File")),
          )
        ],
      ),),
    );
  }
}
