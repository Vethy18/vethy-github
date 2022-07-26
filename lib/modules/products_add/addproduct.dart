
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../shared/components/constans.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  @override
  State<AddProduct> createState() => _AddProductState();
}
class _AddProductState extends State<AddProduct> {

  var descriptionContrroller = TextEditingController();
  var nameConntrroller=     TextEditingController();
  var quantityConntrroller= TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit()..createDatabase(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is InsertProductToDataBaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (context,state){
         var l = LoginCubit.get(context);
         return Scaffold(

          body: SafeArea(
            child: SingleChildScrollView(

              child: Column(
                  children:[
                    Column(

                      children: [

                        SizedBox(height: 30.0,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed:
                                (){
                              setState((){
                               LoginCubit.get(context).imagePicker();

                              });
                                },
                                child:
                                Icon(
                                    Icons.camera_alt

                                )

                            ),
                            Text('upload photo'),
                          ],

                        ),
                        Text('description:'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                           controller: descriptionContrroller,
                            keyboardType: TextInputType.text,
                            // focusNode: primaryFocus,
                            decoration: InputDecoration(
                              border :InputBorder.none ,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),

                          child: Container(
                            width: 160.0,
                            child: TextFormField(
                              controller: quantityConntrroller,
                              // initialValue: 0.toString(),

                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(

                                  labelText: 'Add quantity',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.numbers,
                                  )

                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[400],
                          ),
                          child: MaterialButton(
                            onPressed: (){

                              Navigator.pop(
                                  context
                              );
                            },
                            child: Text('Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                          ),
                          child: MaterialButton(onPressed: (){

                            l.insertProductToDatabase(name:
                             nameConntrroller.text,
                                quantity: quantityConntrroller.text,
                                image: img64!,
                                description: descriptionContrroller.text,
                              context: context
                            );
                          },
                            child: Text('Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),

                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: nameConntrroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: ' product name ',
                              // border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.title,
                              )

                          ),
                        ),
                      ),
                    ),
                  ]

              ),
            ),

          )

          );
        },

      ),
    );
  }
}
