import 'package:bloodbond_app/features/user_auth/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloodbond"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: 'Bloodbond@example.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter email' : null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: 'Enter password',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter password' : null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => RootPage()),
                          (route) => false);
                    },
                    minWidth: double.infinity,
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BloodBond"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // Add your action icon here
            onPressed: () {
              // Do something when the action icon is pressed
            },
          ),
        ],
      ),
      body: const Homepage(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(icon: Icon(Icons.person), label: "person"),
          NavigationDestination(icon: Icon(Icons.graphic_eq), label: "stats")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
