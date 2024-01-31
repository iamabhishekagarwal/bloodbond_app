import 'package:bloodbond_app/pages/sign_in.dart';
import 'package:bloodbond_app/pages/sign_up.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 168, 105),
        title: Text(
          'NourishNet',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSignInButton(context),
                SizedBox(
                  width: 30,
                ),
                _buildSignUpButton(context),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xFF597E52), // Set the color to #597E52
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
                child: Text(
                  'Continue With Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: Color(0xFF597E52), // Set the color to #597E52
          borderRadius:
              BorderRadius.circular(10), // Adjust the radius as needed
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: Color(0xFF597E52), // Set the color to #597E52
          borderRadius:
              BorderRadius.circular(10), // Adjust the radius as needed
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
