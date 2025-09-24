import 'package:dio_crud/models/response_in_list_students.dart';
import 'package:dio_crud/network_manager/repository.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ResponseInListStudents> listData = [];
  bool isLoading = true;

  getApiData() {
    Repository().getApiListModel().then((value) {
      listData = value;

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Dashboard")),
      ),
      body: isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("http://192.168.0.106/ourapi/${listData[index].imageUrl}"),
                ),
                title: Text(listData[index].name!),
                subtitle: Text(overflow: TextOverflow.ellipsis,maxLines: 3,listData[index].projectDesc!),
                trailing: Text(
                  //it is used when we need to show every items from the list if the list contains separated object like below:
                  /**
                   *subjects": [
                          {
                            "subject_id": 201,
                            "subject_name": "Signals and Systems"
                          },
                          {
                            "subject_id": 203,
                            "subject_name": "Digital Electronics"
                          }
                      ]
                   *
                   */
                /*  listData[index].subjects != null
                      ? listData[index].subjects!
                            .map(
                              (element) =>
                                  "${element.subjectName}",
                            )
                            .join(', ')
                      : "No data found",*/
                  //this is only one item showing from the subjects list the first one
                  listData[index].subjects != null
                      ? listData[index].subjects![0].subjectName!
                      : "No data found",

                  style: TextStyle(fontSize: 10),
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
