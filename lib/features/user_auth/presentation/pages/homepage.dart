import 'package:bloodbond_app/features/user_auth/presentation/pages/donateblood.dart';
import 'package:bloodbond_app/features/user_auth/presentation/pages/receiveblood.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Donateblood();
                    },
                  ),
                );
              },
              child: Container(
                width: 170.0,
                height: 130.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text(
                    'Donate blood',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const receiveblood();
                    },
                  ),
                );
              },
              child: Container(
                width: 170.0,
                height: 130.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text(
                    'Receive blood',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     ElevatedButton(

      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (BuildContext context) {
      //               return const Donateblood();
      //             },

      //           ),
      //         );
      //       },
      //       style: ButtonStyle(
      //         textStyle: MaterialStateProperty.all<TextStyle>(
      //         const TextStyle(
      //           fontSize: 15.0, // Set the text size
      //           color: Colors.white, // Set the text color
      //         ),
      //       ),
      //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent ),

      //     ),
      //       child:const Padding(padding: EdgeInsets.all(25.0),
      //       child: Text('Donate blood'),),

      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (BuildContext context) {
      //               return const receiveblood();
      //             },
      //           ),
      //         );
      //       },
      //       style: ButtonStyle(
      //         textStyle: MaterialStateProperty.all<TextStyle>(
      //         const TextStyle(
      //           fontSize: 15.0, // Set the text size
      //           color: Colors.white, // Set the text color
      //         ),
      //       ),
      //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),

      //     ),
      //       child: const Padding(padding: EdgeInsets.all(25.0),
      //       child: Text('Receive blood'),),
      //     ),
      //   ],
      // ),
    );
  }
}
