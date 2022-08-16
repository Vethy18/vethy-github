
import 'dart:convert';
import 'dart:io';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/constant.dart';
import '../../shared/cubit/cubit.dart';

class ProductsEdit extends StatefulWidget {
  const ProductsEdit({Key? key,

      required this.idproduct,
      required this.nameProduct,
     required this.quantity,
     required this.description,
     required this.image,
    required this.buy,
     required this.sell
     }) : super(key: key);
   final String idproduct,nameProduct,quantity,description,image,
          buy,sell;

  @override
  State<ProductsEdit> createState() => _ProductsEditState();
}
class _ProductsEditState extends State<ProductsEdit> {


  var image;
  var changeNameController = TextEditingController();
  var changeQaunatityController = TextEditingController();
  var changedescriptionController = TextEditingController();
  var buyController = TextEditingController();
  var sellController = TextEditingController();
  bool? choosed=false;
  var file;

  @override
  void initState() {
    print(widget.idproduct);
    print(widget.nameProduct);
    print(widget.quantity);
    print(widget.image);
    print(widget.image.length);
    print(widget.description);

    changedescriptionController.text =  widget.description;
    changeQaunatityController.text =    widget.quantity;
    changeNameController.text  =   widget.nameProduct;
    buyController.text= widget.buy;
    sellController.text=widget.sell;
    setState((){
    img64 = widget.image;
      image= img64;
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is UpdateProductState )
          {
            Navigator.pop(context);
          }
        if(state is DeleteProductState)
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


                        choosed==false ? Container(child:Image(
                          image: MemoryImage(base64Decode(image)),
                        ) ,):

                        Container(child:Image(
                          image: MemoryImage(base64Decode(file)),
                        )

                        ),

                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed:
                                  ()  {
                                    setState(()async{
                                file=await LoginCubit.get(context).imagePicker();
                                  choosed=true;
                                });
                              },
                                  child:
                                  const Icon(
                                      Icons.camera_alt

                                  )

                              ),
                              const Text('upload photo'),
                            ],

                          ),
                          const Text('description:'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),

                            child: TextFormField(

                              controller: changedescriptionController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                border :InputBorder.none ,
                              ),

                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          const SizedBox(height: 20.0,),
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
                                controller: changeQaunatityController,

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
                                controller: changeNameController,
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
                                  LoginCubit.get(context).deleteProduct(id: widget.idproduct,

                                  );

                                },
                                child: const Text('Delete',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue,
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                  LoginCubit.get(context).updateProduct(
                                      changeNameController.text,
                                      changeQaunatityController.text,
                                      file ?? widget.image,
                                      changedescriptionController.text,
                                      widget.idproduct,
                                      buyController.text,
                                      sellController.text


                                  )
                                    (

                                  );
                                  if (kDebugMode) {
                                    print(widget.nameProduct);
                                  }
                                  if (kDebugMode) {
                                    print(widget.quantity);
                                  }
                                  if (kDebugMode) {
                                    print(widget.image);
                                  }
                                  if (kDebugMode) {
                                    print(widget.description);
                                  }

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


