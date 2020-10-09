import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:future_builder_demo/AddContact.dart';
import 'package:future_builder_demo/MyModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  //List<MyModel>list=[];
  List<QueryDocumentSnapshot>myList=[];
  CollectionReference mRef=FirebaseFirestore.instance.collection('a');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contact'),actions: [
        IconButton(icon: Icon(Icons.add), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContact()));
        })
      ],),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          //future: FirebaseFirestore.instance.collection('a').get(),
          stream: FirebaseFirestore.instance.collection('a').snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            /*if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              //Map<String, dynamic> data = snapshot.data.docs [0].data();
              //return Text("Full Name: ${data['name']} ${data['address']}");
              myList=snapshot.data.docs;
            }
            return ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context,index){
                  return ListTile(title:Text(myList[index].data()['name']) ,);
                });*/
            if(snapshot.data==null){
              return Container(child: Center(child: Text('No Data'),),);
            }else{return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                //final item = snapshot.data.docs[index];
                //final itemID = snapshot.data.docs[index].id;
                final list = snapshot.data.docs;
                return ListTile(title:Text(list[index]['name']) ,);
              },
            );}
        },
        ),

      ),
    );
  }
  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {

      });
    }
  }
}

