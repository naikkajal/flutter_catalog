import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Column(
        children: [
          Image.asset("assets/images/login_image.png",
          fit: BoxFit.cover),
          SizedBox(
            height: 35,
          ),
          Text("Welcome",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30, vertical: 20),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
              SizedBox(
                 height: 90,
              ),
              ElevatedButton( 
                child: Text("Login"),
                style: TextButton.styleFrom(), 
                onPressed: () {  },
              )
            
              ],
            ),
          )
        ],
        
      )
    );
  }
}