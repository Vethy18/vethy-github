
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constant.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  @override
  State<AddProduct> createState() => _AddProductState();
}
class _AddProductState extends State<AddProduct> {

  var descriptionController = TextEditingController();
  var nameController=     TextEditingController();
  var quantityController= TextEditingController();
  var buyController=TextEditingController();
  var sellController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
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

                      const SizedBox(height: 30.0,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed:
                              (){
                            setState((){
                             LoginCubit.get(context).imagePicker();

                            });
                              },
                              child: const Icon(
                                  Icons.camera_alt

                              )

                          ),
                          const Text('upload photo'),
                        ],

                      ),
                      const Text(
                          'description:'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(

                         controller: descriptionController,
                          textInputAction: TextInputAction.newline,
                          textAlignVertical:TextAlignVertical.bottom ,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border :InputBorder.none ,

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          width: 160.0,
                          child: TextFormField(
                            controller: quantityController,

                            // initialValue: 0.toString(),

                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(

                                labelText: 'quantity',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.numbers,
                                )

                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25.0,
                        ),
                        Container(

                          width: 160.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)
                          ),

                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: ' product name ',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.title,
                                )

                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          width: 160.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)
                          ),

                          child: TextFormField(
                            controller: buyController,

                            // initialValue: 0.toString(),

                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(

                                labelText: 'prix d\'achat',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.numbers,
                                )

                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 25.0,
                        ),
                        Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: TextFormField(
                            controller: sellController,

                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(

                                labelText: 'prix d\'vente',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.numbers,
                                )

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            child: const Text('Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                          ),
                          child: MaterialButton(onPressed: (){

                            l.insertProductToDatabase(name: nameController.text,
                                quantity: quantityController.text,
                                image: img64!,
                                description: descriptionController.text,
                                buy: buyController.text,
                                sell: sellController.text,
                                context: context
                            );
                          },
                            child: const Text('Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ]

            ),
          ),

        )

        );
      },

    );
  }
}
