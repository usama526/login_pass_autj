import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,

      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              SizedBox(height: 180,
          child: SvgPicture.asset('login.svg',fit: BoxFit.contain),
          ),
              Text("Welcome",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

              ),
              SizedBox(height: 20,),
              ActionChip(label: Text("Logout"), onPressed: (){}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
