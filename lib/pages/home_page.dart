import 'package:dio_crud/models/ResponseInMapModel.dart';
import 'package:dio_crud/network_manager/repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //coding start here
  ResponseInMapModel responseInMapModel = ResponseInMapModel();
  bool loading = true;
  getData() {
    Repository()
        .getApiMapModel()
        .then((value) {
          print("Data length: ${value.myJsonObject?.length}");
          responseInMapModel = value;
          loading = false;
          setState(() {

          });
        })
        .onError((error, stackTrace) {
          print("error: ${error.toString()}");
        });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Dio App")),
      ),

      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: responseInMapModel.myJsonObject!.length,
              itemBuilder: (context, index) {

                var item = responseInMapModel.myJsonObject?[index];



                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage("${item?.imgData!.baseUrl}${item?.imgData!.fileName}"),),
                      title: Text(item!.name!),
                      subtitle: Text(item.details!),
                      //trailing: Text(responseInMapModel.myJsonObject?[index].attributes?.join(', ')??"No data found"),
                      trailing: Text(

                        //if only we had array data like below and want to show every items:
                        /**
                         *"attributes": [
                              "Smell",
                              "Red",
                              "Nice"
                            ]
                         *
                         */
                        (item.attributes == null ||
                            item.attributes!.isEmpty)
                            ? "No data found"
                            : item.attributes!.join(', '),
                      ),
                    ),

                    Divider(color: Colors.black54, height: 1, thickness: 1),
                  ],
                );
              },
            ),
    );
  }
}
