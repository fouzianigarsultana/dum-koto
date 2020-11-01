import 'package:flutter/material.dart';
import 'package:mullayon/login/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  //static const String id= ""

  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState(){
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    //initApp();
  }

//  void initApp() async {
//    FirebaseApp defaultApp = await Firebase.initializeApp();
//    _auth = FirebaseAuth.instanceFor(app: defaultApp);
//    // immediately check whether the user is signed in
//    checkIfUserIsSignedIn();
//  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                width: width,
                height: height*0.45,
                child: Image.asset('assets/images/login.png',fit: BoxFit.fill,),
              ),
              Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 30.0,),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    color: Color(0xffEE7B23),
                    onPressed:() async{
                      if(_emailController.text.isEmpty || _passwordController.text.isEmpty)
                        {
                          print("Email or Password is empty");
                          return;
                        }
                      try{
                        final user = await AuthHelper.signInWithEmail(
                          email: _emailController.text,
                          pass: _passwordController.text);
                            if(user != null)
                              {
                                print("LogIn successful");
                              }
                      }catch(e){
                        print(e);
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text('Login With Google'),
                    color: Color(0xffEE7B23),
                    onPressed: ()async{
                      try{
                        await AuthHelper.signInWithGoogle();
                      }catch(e){

                      }
                    },
                  ),

                  GestureDetector(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                    },
                    child: Text.rich(
                      TextSpan(
                          text: 'Don\'t have an account',
                          children: [
                            TextSpan(
                              text: 'Signup',
                              style: TextStyle(
                                  color: Color(0xffEE7B23)
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                ]
            )
        )
    )
    );
  }
}
