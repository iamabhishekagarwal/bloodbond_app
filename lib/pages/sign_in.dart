import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 168, 105),
        title: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: 'Bloodbond@example.com',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
              validator: (value) {
                return value!.isEmpty ? 'Please enter email' : null;
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: 'Enter password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
              validator: (value) {
                return value!.isEmpty ? 'Please enter password' : null;
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {},
              minWidth: double.infinity,
              color: Color.fromARGB(255, 89, 126, 82),
              textColor: Colors.white,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
