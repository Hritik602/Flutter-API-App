import 'package:flutter/material.dart';
import 'package:flutter_app_api/Api%20service%202/api_service2.dart';
import 'package:flutter_app_api/Model/single_user.dart';



class ParticularUser extends StatelessWidget {
  const ParticularUser({Key? key,this.userId}) : super(key: key);

  final int? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<SingleUser>(
            future: ApiFetch().singleUser(userId!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
              //  print( "Data + ${snapshot.data.toString()}");
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.network(snapshot.data.data.avatar,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Center(child: Text("${snapshot.data.data.firstName}  ${snapshot.data.data.lastName}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Text(snapshot.data.data.email,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(snapshot.data.support.text,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                );
              }

              return const Center(child: LinearProgressIndicator());


            },

          )
      ),
    );
  }
}
