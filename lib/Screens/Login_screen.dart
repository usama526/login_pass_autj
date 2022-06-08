import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/avd.dart';
import 'package:login_pass_autj/Authentication_service.dart';
import 'package:login_pass_autj/Screens/Home_Screen.dart';
import 'package:login_pass_autj/Screens/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context);

    final emailFiled = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );
    //for password text field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          auth.signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
        },
        child: const Text("Login",textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,color: Colors.black45,fontWeight: FontWeight.bold
        ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
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
                    child:Container(
                        height: 200,width: 200,
                        child: SvgPicture.asset('login.svg')),
                  ),
                  emailFiled,
                  passwordField,
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: loginButton,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text("Don't have an account?"),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:(context) =>
                              RegistrationScreen()
                              ),
                          );
                        },
                        child: Text(
                          "signUp",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
