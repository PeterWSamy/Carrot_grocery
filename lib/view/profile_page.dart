import 'package:carrot/authintication/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   @override
   Widget build(BuildContext context){
    return ListView(
      children: [
       ListTile(
          onTap: signOut,
          leading: const  Icon(Icons.logout_rounded,color: Colors.black54,),
          title: const Text("Logout",style: TextStyle(fontSize: 16,color: Colors.black45),),
          
        )
      ],
    );
   }
  void signOut(){
    FirebaseServices.signOut();
    Hive.box('carts').compact();
    Hive.close();
  }
}