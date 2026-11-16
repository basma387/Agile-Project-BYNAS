import 'package:bynas/theme/colors.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget{
  const Login ({Key?key});

  @override
  State<Login> createState()=> _LoginState();
}

class _LoginState extends State<Login>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ColorManager.backgroundBeige,
      body:SafeArea(
        child: Column(
        children: [
          Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/GradCap.jpg'),
          )
          ),
      ],
      ),
      ),
    );

    }
  }

