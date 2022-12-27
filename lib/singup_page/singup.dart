import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller/login_page/login.dart';

class Singup extends StatelessWidget {
  Singup({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Form(
        key: _formkey,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Create an account ',
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
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 10),
                                    labelText: 'User name',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                validator: (value) {
                                  // ignore: avoid_print
                                  print(value);
                                  if (value!.length <= 4) {
                                    return 'name should be atleast 4 charachter';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 10),
                                    labelText: 'Email',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                              ),
                              const SizedBox(
                                height: 20,
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
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: confirmpasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 10),
                                    labelText: 'Confirm Password',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
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
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  createUser(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                }
                              },
                              color: const Color.fromARGB(255, 32, 152, 237),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> createUser({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    final auth = FirebaseAuth.instance;
    final userRef = FirebaseFirestore.instance.collection('users');
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userRef.doc(auth.currentUser!.uid).set({
        'userid': auth.currentUser!.uid,
        'email': email,
        'password': password,
        'userName': name,
        'profileImage': ''
      });

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code),
        ),
      );
    }
  }
}
