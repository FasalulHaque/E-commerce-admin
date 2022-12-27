import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/home/dashboard.dart';
import 'package:seller/home/home.dart';
import 'package:seller/login_page/bloc/authentication_bloc_bloc.dart';
import 'package:seller/singup_page/singup.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _authbloc = AuthenticationBlocBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authbloc,
      child: BlocListener<AuthenticationBlocBloc, AuthenticationBlocState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Dashbard(),
                ));
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black,
                )),
          ),
          // ignore: sized_box_for_whitespace
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Login to your account',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: mailController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 10),
                                  labelText: 'Email',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 10),
                                  labelText: 'Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () => _authbloc.add(LoginEvent(
                              email: mailController.text,
                              password: passwordController.text,
                            )),

                            // Navigator.push(
                            //  context,
                            // MaterialPageRoute(
                            // builder: (context) => const Dashbard()));

                            color: const Color.fromARGB(255, 32, 152, 237),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Do"t have an account'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Singup()));
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
