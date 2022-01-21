import 'package:flutter/material.dart';

import 'package:flutter_app_api/Model/single_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.userId}) : super(key: key);
   final int ? userId;




  @override
  State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {
 late  Future<SingleUser> data;


  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   data=ApiFetch().singleUser();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<SingleUser>(
          future: data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print( "Data + ${snapshot.data.toString()}");
            return Container(
              child: Column(
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

                ],
              ),
            );
            }

              return const Center(child: LinearProgressIndicator());


          },

        )
      )
    );
  }
}


class SingleUserUi extends StatelessWidget {
   const SingleUserUi({Key? key,this.snapshot,this.userIndex}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final  snapshot;
  final int ? userIndex;
  @override
  Widget build(BuildContext context) {

    var snap=snapshot!.data.data[userIndex];
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.network(snap.avatar,
            fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 30,),
          Center(child: Text("${snap.firstName}  ${snap.lastName}",
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w400,
          ),
          ),
          ),
          const SizedBox(height: 20,),
          Text(snap.email,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),

        ],
      ),
    );
  }
}
