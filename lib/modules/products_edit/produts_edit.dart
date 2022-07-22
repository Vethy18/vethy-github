
import 'dart:convert';
import 'dart:io';

import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constans.dart';
import '../../shared/cubit/cubit.dart';

class ProductsEdit extends StatefulWidget {
  const ProductsEdit({Key? key,

     required this.idproduct,
      required this.nameProduct,
     required this.quantity,
     required this.description,
     required this.image}) : super(key: key);
   final String idproduct,nameProduct,quantity,description,image;

  @override
  State<ProductsEdit> createState() => _ProductsEditState();
}
class _ProductsEditState extends State<ProductsEdit> {
  // late  String path_file;
// File? file;

  // Future imagePicker() async {
  //   final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   setState((){
  //     file = File(myfile!.path);
  //   });
  //   return file!;
  // }

  @override
  void initState() {
    print(widget.idproduct);
    print(widget.nameProduct);
    print(widget.quantity);
    print(widget.image);
    print(widget.image.length);
    print(widget.description);
    changedescriptionController.text=widget.description;
    changeQaunatityController.text=widget.quantity;
    changeNameController.text= widget.nameProduct;
      //
      //  setState((){
      // img64 =widget.image;
      //  });
   // //
   //  setState((){
   //     path_file = widget.image.replaceRange(0,5, "");
   //
   //    // path_file.split(path_file).last;
   //
   //
   //   });
     // print(path_file);

    super.initState();
  }
  var changeNameController = TextEditingController();
  var changeQaunatityController = TextEditingController();
  var changedescriptionController = TextEditingController();
    bool? choosed=false;
   late File file;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit()..createDatabase(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is UpdateProductState )
            {
              Navigator.pop(context);
            }
        },
        builder: (context,state){

          return  Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                      children:[
                        Column(
                          children: [
                          // Image.asset('images/camera.jpg'),
                          //      Image.file(File:'/data/user/0/com.example.cado/cache/image_picker935748229958109805.jpg'),


                          choosed==false ? Container(child:Text(widget.image)):Container(child:Image.file(file)),

                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(onPressed:
                                    () async {

                                  file=await LoginCubit.get(context).imagePicker();
                                  setState((){
                                    choosed=true;
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

                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                // initialValue: widget.description,
                                controller: changedescriptionController,

                                // initialValue: 'if you want to take any photo'
                                //     '\n  with a high  quality be sue \n'
                                //     'that this Camere is what you\'re loocking for',
                                decoration: InputDecoration(
                                  border :InputBorder.none ,
                                ),

                              ),
                            ),
                            SizedBox(height: 10.0,),
                            SizedBox(height: 20.0,),

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

                                  controller: changeQaunatityController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(

                                      labelText: 'Edit quantity',
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
                                LoginCubit.get(context).deleteProduct(id: widget.idproduct,
                                context: context
                                );
                                },
                                child: Text('Delete',
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
                              child: MaterialButton(
                                onPressed: (){
                                 LoginCubit.get(context).updateProduct
                                   (
                                     name:changeNameController.text,
                                   quantity: changeQaunatityController.text,
                                     image: file,
                                     description: changedescriptionController.text,
                                      id: widget.idproduct);
                                     print(widget.nameProduct);
                                     print(widget.quantity);
                                      print(widget.image);
                                      print(widget.description);

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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),

                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: changeNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: 'Edit product name ',
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


