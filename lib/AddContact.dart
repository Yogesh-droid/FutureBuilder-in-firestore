import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
 final namCon=TextEditingController();
 final addCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact'),),
      body: Container(
        child: Column(
          children: [
            TextField(controller: namCon,),
            TextField(controller: addCon,),
            RaisedButton(onPressed: (){
              var myMap={'name':namCon.text,'address':addCon.text};
              FirebaseFirestore.instance.collection('a').add(myMap);
            })
          ],
        ),
      ),
    );
  }
}
