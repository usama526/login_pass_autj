import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_pass_autj/Screens/Home_Screen.dart';
import 'package:provider/provider.dart';

import '../Authentication_service.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController =new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthenticationService>(context);
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );
    /////////////
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "second Name",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );
    /////////////
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );
    ////////////
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password ",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );
    //////////////
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      onSaved: (value){
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password ",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder:(context) =>
                    HomeScreen()
            ),
          );
        },
        child: const Text("Sign Up",textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,color: Colors.black45,fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    /////////
    return Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back,color: Colors.red),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Center(
            child: SingleChildScrollView(
            child: Container(
                color: Colors.white70,

                child: Padding(
                padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(
                  height: 200,
                  child:SizedBox(
                      height: 200,width: 200,
                      child: SvgPicture.asset('login.svg')),
                ),
                firstNameField,
                const SizedBox(height: 45),
                secondNameField,
                const SizedBox(height: 45),
                emailField,
                SizedBox(height: 45),
                passwordField,
                SizedBox(height: 45),
                confirmPasswordField,
                SizedBox(height: 45),
                signUpButton,
                SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.only(top:8.0),


                ),

              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
