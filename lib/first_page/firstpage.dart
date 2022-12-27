import 'package:flutter/material.dart';
import 'package:seller/login_page/login.dart';
import 'package:seller/singup_page/singup.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          'assets/image/mobile-login-concept-illustration_114360-83-removebg-preview.png'),
                    )
                        //     image: NetworkImage(
                        //         'https://www.alert-software.com/hubfs/custom_desktop_wallpaper.png'))),
                        ),
                  ),
                  Column(
                    children: <Widget>[
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: <Widget>[
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                   builder: (context) => Singup()));
                            },
                            color: const Color.fromARGB(255, 32, 152, 237),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
