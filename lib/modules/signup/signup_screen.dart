
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../main.dart';

class Signup_screen extends StatelessWidget
{

  var name = TextEditingController(), tel= TextEditingController(),
      email= TextEditingController(), pass= TextEditingController(),
      confpass= TextEditingController() ;


  var formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit()..createDatabase(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if (state is InsertToDataBaseState) {
            Navigator.pop(context);

          }
        },
        builder: (context,state){
          var screen= LoginCubit.get(context);
          return  Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('Sign up',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold

                        ),

                      ),
                      SizedBox(
                        height: 15.0,),
                      TextFormField(

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'enter your name';
                          }
                          return null;
                        },

                        keyboardType: TextInputType.text,
                        controller: name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'votre nom',
                            prefixIcon: Icon(
                                Icons.person
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15.0,),
                      TextFormField(

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'enetr your phone number';
                          }
                          return null;
                        },

                        controller: tel,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'numero de telephone',
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,),
                      TextFormField(

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'email must not be embty';
                          }
                          return null;
                        },

                        controller: email,
                        keyboardType:  TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'votre email',

                            prefixIcon: Icon(

                              Icons.email,
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15.0,),
                      TextFormField(

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'password must not be embty';
                          }
                          return null;
                        },

                        controller: pass,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:  screen.ispassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'votre mot de passe',

                          prefixIcon: Icon(
                              Icons.lock
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){
                             screen.passowrd();

                            },
                            icon: screen.ispassword ? Icon(
                              Icons.visibility,
                            ):Icon(Icons.visibility_off),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 15.0,),
                      TextFormField(

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'confirm passowrd';
                          }
                          return null;
                        },

                        controller: confpass,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: screen.ispassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'confirme mot de passe',
                          prefixIcon: Icon(
                              Icons.lock
                          ),
                          suffixIcon:IconButton(
                            onPressed: (){
                              screen.passowrd();
                              // });

                            },
                            icon: screen.ispassword ? Icon(
                              Icons.visibility,
                            ):Icon(Icons.visibility_off),
                          ),

                        ),
                      ),
                      Center(
                        child: MaterialButton(onPressed: (){
                          if(formkey.currentState!.validate()){

                           screen.insertToDatabase(
                               name: name.text,
                               tel: tel.text,
                               email: email.text,
                                pass: pass.text
                               , confpass: confpass.text
                           );

                          }
                        },

                          child: Text('se connecter',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0
                            ),

                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          );

        }
      ),
    );
  }




  // _signupUser() async{
  //   print(name.text);
  //   print(tel.text);
  //   print(email.text);
  //   print(pass.text);
  //   print(confpass.text);
  //   pass.text == confpass.text?
  //   insertToDatabase(
  //     name.text,
  //     tel.text,
  //     email.text,
  //     pass.text,
  //
  //   ):Text('erreur');
  //   // var res= await ApiService().insertToDatabase(name, tel, email, pass, confpass);
  //
  // }

  //  insertToDatabase(
  //     name,
  //     tel,
  //     email,
  //     pass,
  //
  //     ) async
  // {
  //
  //   return await  database.transaction((txn)async{
  //
  //     txn.rawInsert('INSERT INTO users(name, tel , email ,pass)VALUES'
  //         '("$name","$tel","$email","$pass") '
  //     ).then((value) {
  //
  //       print('$value inserted successfully');
  //     }).catchError((error){
  //
  //       print('error when inserting ${error.toString()}');
  //     });
  //
  //     return null;
  //   });
  // }
}




