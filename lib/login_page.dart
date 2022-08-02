import 'package:ecommer_shop/core/const.dart';
import 'package:ecommer_shop/registration_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey= GlobalKey<FormState>();

  final TextEditingController emailController =TextEditingController ();
  final TextEditingController passwordController =TextEditingController ();
  

  @override
  Widget build(BuildContext context) {
    // email field
    final emaiField= TextFormField(
      autofocus: false ,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        emailController.text= value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon : Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10)
          )
      ),

    );

// Passwprd field
    final passField= TextFormField(
      autofocus: false ,
      controller: passwordController,
      obscureText: true,
      
      onSaved: (value){
        emailController.text= value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon : Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10)
          )
      ),

    );

    
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: AppColors.five,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: (){},
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      
      ),


    );

    return Scaffold(
      backgroundColor: AppColors.two,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(height: 200, child : Image.asset("assets/logo.png", fit: BoxFit.contain,)
                    SizedBox(height: 10),
                    emaiField,
                    SizedBox(height: 10),
                    SizedBox(height: 10), passField, SizedBox(height: 20),
                    loginButton, SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't you have an account?"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:((context) => RegistrationSc())));
                          },
                          child: Text(" Sign up", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ), 
                          ),
                        )
                      ],
                    )
                  ],
                  ) 
          ),
        ),
      )),
    )
    );
  } 
}