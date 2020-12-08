import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/Screen/LoginScreen.dart';



class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text('Home',style: TextStyle(color: Colors.white),),),
      body:

      Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(bottom:15.0),
              child: new Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMW0LKcpGP77VJsaCwyb2WcmkuWSo6wQKDcw&usqp=CAU")
                      )
                  )),
            ),
            MaterialButton(
            elevation: 0,
            height: 50,
            color: Colors.orange,
            child: Text('Logout',style: TextStyle(color: Colors.white),),onPressed: (){
            auth.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      },),
          ],
        ),),
    );
  }
}