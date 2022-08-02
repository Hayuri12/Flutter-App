import 'package:ecommer_shop/core/my_flutter_app.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'core/const.dart';

class RegistrationSc extends StatefulWidget {
  const RegistrationSc({Key? key}) : super(key: key);

  @override
  State<RegistrationSc> createState() => _RegistrationScState();
}

class _RegistrationScState extends State<RegistrationSc> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController FirstNameController = TextEditingController();
  final TextEditingController SecondnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: FirstNameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        FirstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: RequiredValidator(errorText: "This field is required"),
    );

    final secondNameField = TextFormField(
      autofocus: false,
      controller: SecondnameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        SecondnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: RequiredValidator(errorText: "This field is required"),
    );

    final mailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: MultiValidator([
        RequiredValidator(errorText: "Required"),
        EmailValidator(errorText: "This Email is not Valid "),


      ]),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final passField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          
          ),
      
      validator: MultiValidator([
        RequiredValidator(errorText: 'password is required'),  
        MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),  
        PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
      ]),
    );
    

    final ConfirmpassField = TextFormField(
      autofocus: false,
      controller: ConfirmpasswordController,
      obscureText: true,
     
      
      onSaved: (value) {
        ConfirmpasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          
    );

    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: AppColors.five,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: (){
          final isValidForm = _formKey.currentState!.validate();
        },
        child: const Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      
      ),


    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.two,
        elevation: 0,
        leading: IconButton( 
          icon: const Icon(MyFlutterApp.left_open), 
          onPressed: () { 
            Navigator.pop(context);
           },
          ),
      ),
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
                      
                      firstNameField,
                      SizedBox(height: 10),
                      secondNameField,
                      SizedBox(height: 10),
                      mailField,
                      SizedBox(height: 10), 
                      passField, 
                      SizedBox(height: 10),
                      ConfirmpassField, 
                      SizedBox(height: 20),
                      SignUpButton,
                      
                    ],
                  )),
            ),
          )),
        ));
  }
}
