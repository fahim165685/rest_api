import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login".toUpperCase(),
            style: TextStyle(color: Colors.grey[300], fontSize: 30),
          ),
          buildTextFormField(
            controller: emileController,
            validator: (emile) {
              if (emile != null && emile.length < 4) {
                return "Enter your Emile";
              }
              return null;
            },
            prefixIcon: const Icon(Icons.email),
            labelText: "Emile",
          ),
          buildTextFormField(
              obscureText: isVisibility,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (password) {
                if (password != null && password.length < 6) {
                  return "Enter your password";
                }
                return null;
              },
              prefixIcon: const Icon(Icons.password_rounded),
              labelText: "password",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                  icon: (isVisibility == true)
                      ? const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.lock_open_outlined,
                          color: Colors.redAccent,
                        ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: ElevatedButton(
                onPressed: () {
                  final isValidFrom = formKey.currentState!.validate();
                  if (isValidFrom) {}
                },
                style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(
                        Size(double.maxFinite, 30)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.redAccent),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)))),
                child: const Text("Submit")),
          )
        ],
      ),
    );
  }

  Widget buildTextFormField({
    bool obscureText = false,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    required String labelText,
    required Widget prefixIcon,
    Widget? suffixIcon,
    int? maxLength,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        validator: validator,
        style: const TextStyle(fontSize: 20),
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: "Enter Your $labelText",
          hintStyle: const TextStyle(fontSize: 15),
          focusColor: Colors.deepPurpleAccent,
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.purpleAccent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.purpleAccent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.deepPurpleAccent)),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
