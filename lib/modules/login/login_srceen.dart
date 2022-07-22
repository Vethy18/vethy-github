import 'package:cado/Api/apiService.dart';
import 'package:cado/modules/products_screen/products_screen.dart';
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget
{
  var keyForm = GlobalKey<FormState>();
 bool connected=false;
  late Database database;
  var username = TextEditingController();
  var password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit()..createDatabase(),
      child: BlocConsumer<LoginCubit,LoginStates>(
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
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(

                        controller: username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
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
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(

                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: c.ispassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          labelText: 'your passowrd',
                          suffixIcon: IconButton(
                            onPressed: () {
                              c.passowrd();
                            },
                            icon: c.ispassword ? Icon(
                              Icons.visibility,
                            ) : Icon(Icons.visibility_off),
                          ),

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'must not be empty';
                          }
                          return null;
                        },
                      ),
                     SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
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
                          child: Text(
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

                          Text(
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
                            child: Text('Submit'),
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


      ),
    );



    }


  }

  void viduser(Widget cont)
  {

  }
