import 'package:bloodbond_app/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bloodbond_app/features/authentication/controllers/signup_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignupController controller = Get.put(SignupController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 168, 105),
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Connect the GlobalKey to the Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: 'Enter your Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return value!.isEmpty ? 'Please enter email' : null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.password,
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.phoneNo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    hintText: 'Phone Number',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return value!.isEmpty ? 'Please confirm password' : null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.fullName,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    hintText: 'Enter your full name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter your full name'
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final user = UserModel(
                          fullName: controller.fullName.text.trim(),
                          email: controller.email.text.trim(),
                          phoneNo: controller.phoneNo.text.trim(),
                          password: controller.password.text.trim());
                      SignupController.instance.createUser(user);
                    }
                  },
                  minWidth: double.infinity,
                  color: const Color.fromARGB(255, 89, 126, 82),
                  textColor: Colors.white,
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
