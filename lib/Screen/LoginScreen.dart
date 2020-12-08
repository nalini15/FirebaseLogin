import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/Screen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final FirebaseAuth firebaseAuth= FirebaseAuth.instance;
final GoogleSignIn googleSignIn =GoogleSignIn();

String _email, _password;
final auth = FirebaseAuth.instance;


class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login',style: TextStyle(color: Colors.white),),
      centerTitle: true,),
      backgroundColor: Colors.black87,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Welcome',
                textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28,color: Colors.deepOrange),),

              SizedBox(height: 20),

              Text('Enter your email and password to continue',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17,color: Colors.white),),

              SizedBox(height: 50,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.white)),
                child: TextField(

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      icon: Icon(Icons.email,color: Colors.white,),

                      border: InputBorder.none
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.white)),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                 // keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hintText: 'Password',

                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      icon: Icon(Icons.lock,color: Colors.white,),

                      border: InputBorder.none
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),


              SizedBox(height: 30),

              MaterialButton(
                elevation: 0,
                height: 50,

                onPressed: (){
                  auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                  });

                },
                color: Colors.orange,
                child: Text('Sign In ',style: TextStyle(color: Colors.white,fontSize: 16)),


              ),
              SizedBox(height: 20),

              MaterialButton(
                elevation: 0,
                height: 50,
                onPressed: _signInWithGoogle,
                color: Colors.orange,
                child: Text('Sign In with Google',style: TextStyle(color: Colors.white,fontSize: 16)),


              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _signInWithGoogle() async
  {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken,accessToken: googleAuth.accessToken);
    final FirebaseUser user =(await firebaseAuth.signInWithCredential(credential)).user;
  }

  // _buildTextField(TextEditingController controller, IconData icon, String labelText){
  //  return Container(
  //    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //    decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.white)),
  //    child: TextField(controller: controller,
  //    style: TextStyle(color: Colors.white),
  //    decoration: InputDecoration(
  //      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
  //      labelText: labelText,
  //      labelStyle: TextStyle(color: Colors.white),
  //      icon: Icon(icon,color: Colors.white,),
  //
  //        border: InputBorder.none
  //
  //    ),),
  //  );
  // }

}
