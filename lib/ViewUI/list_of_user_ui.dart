import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_api/Api%20service%202/api_service2.dart';
import 'package:flutter_app_api/Model/create_new_user.dart';
import 'package:flutter_app_api/Model/list_of_users.dart';
import 'package:flutter_app_api/ViewUI/single_user_ui.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
 // late Future<ListUser> usersList;
 //
 //  @override
 //  void initState() {
 //    // TODO: implement initState
 //    super.initState();
 //    usersList=ApiFetch().listOfUsers() ;
 //  }

  TextEditingController name=TextEditingController(text:"morpheus");
  TextEditingController job=TextEditingController(text:"leader");

  CreateNew createNew=CreateNew();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:CreateUser(name:name,job:job),
      appBar: AppBar(
        title: const Text("List Of Uers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder<ListofUsers>(
            future: ApiFetch().listOfUsers(),
            builder:(BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                print(snapshot.data.data[0].avatar);
                // return Center(child: Text(snapshot.data.data[0].id.toString()));
                return  ListView.builder(
                      itemCount:snapshot.data.data.length ,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context,   MaterialPageRoute(builder: (context)=> ParticularUser(userId: snapshot.data.data[index].id)));
                          },
                          child: Column(
                            children: [
                              Image.network(snapshot.data.data[index].avatar,
                              fit: BoxFit.cover,
                              ),
                              const SizedBox(height:10,),
                              Center(child: Text("${snapshot.data.data[index].firstName}  ${snapshot.data.data[index].lastName}",
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              ),
                              Text(snapshot.data.data[index].email,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        );
                      }


                );
              }
              else {
                return const Center(child: CircularProgressIndicator(),);
              }

            }
          ),
        ),
      ),
    );
  }
}

class CreateUser extends StatelessWidget {
  const CreateUser({Key? key,this.name,this.job}) : super(key: key);

  final name;
  final job;

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (){
        print('Clicked');
        showDialog(context: context, builder: (BuildContext context)
        {
          return  AlertDialog(
            actionsPadding: const EdgeInsets.all(8.0),

            title: const Text('data'),
            actions: [
              TextField(
                decoration: const InputDecoration(
                    hintText: 'Name'
                ),
                controller: name,
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText: 'Job Title'
                ),
                controller: job,
              ),
              ElevatedButton(
                  onPressed: () async{

                     final res= await ApiFetch().createNewUser(name.text, job.text);
                    final CreateNew user=CreateNew(name:name.text,job:job.text);
                    // print("The name o ${createNew.name}");
                    // print(createNew.createdAt);
                  },

                  child: const Text('Create')
              )
            ],
          );
        }
        );
      },
    );
  }
}


class NumUserUi extends StatelessWidget {
  const NumUserUi({Key? key,this.users}) : super(key: key);

  final AsyncSnapshot ? users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount:users!.data.length ,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Image.network(users!.data.data[index].avatar),
                ],
              );
            }

        ),
      ),
    );
  }
}
