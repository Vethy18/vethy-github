
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget
{
  var keyForm = GlobalKey<FormState>();

 bool connected=false;

  var username = TextEditingController();
  var password = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
            
      },
      builder: (context,state){
        var c =LoginCubit.get(context);
        return  Scaffold(

          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(

                      controller: username,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        labelText: 'your name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(

                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: c.ispassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        labelText: 'your passowrd',
                        suffixIcon: IconButton(
                          onPressed: () {
                            c.passowrd();
                          },
                          icon: c.ispassword ? const Icon(
                            Icons.visibility,
                          ) : const Icon(Icons.visibility_off),
                        ),

                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'must not be empty';
                        }
                        return null;
                      },
                    ),
                   const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                          c.Login(username: username.text,
                               passowrd:password.text,

                               context: context
                           );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),

                        ),
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                Signup_screen())
                            );
                          },
                          child: const Text('Submit'),
                        )
                      ],
                    )
                  ],

                ),
              ),
            ),
          ),

        );

      },


    );



    }


  }

