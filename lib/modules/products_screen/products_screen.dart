
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/modules/products_edit/produts_edit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cado/shared/cubit/states.dart';
import '../../shared/components/constant.dart';
import '../products_add/addproduct.dart';

class ProductsScreen extends StatefulWidget {
   const ProductsScreen({Key? key,}) : super(key: key);


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

var searchController=TextEditingController();

 // List<ProductsScreen> selected=[];

  ProductsScreen? selected ;
  bool values =false;

@override
  void initState()
{

    super.initState();

if (kDebugMode) {
  print(listProducts);
}

    // selected=ListProducts.cast();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){

      },
        builder:  (context,state){

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
              color: Colors.blue,
              iconSize: 25.0,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                FloatingActionButton(
                    mini: true,
                  heroTag: 'b1',
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder:
                                  (context)=>const AddProduct()
                          )
                      );
                    },

                    child: const Icon(
                        Icons.add
                    )


                ),
              ],
            ),
            titleSpacing: 70.0,
            actions:  [

               Container(
                width: 160.0,
                decoration: const BoxDecoration(),
                child: TextFormField(
                  onChanged: (value){

                    LoginCubit.get(context).searchProduct(value);


                  },

                  controller: searchController,

                  keyboardType: TextInputType.text,
                  decoration:  const InputDecoration(
                    // ghh,
                      label: Text('Search'),
                      prefixIcon:Icon(
                        Icons.search,
                      )
                  ),
                ),

              ),
            ],


          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'b2',
            onPressed: () {

            },
            child: const Icon(
               Icons.shopping_cart
            ),
          ),
          body:SafeArea(

            child: ConditionalBuilder(
              condition:listProducts.isNotEmpty,
              builder: (context)=>ListView.builder(itemCount: listProducts.length,

                  itemBuilder:
                   (context, index) {

                    return Card(
                        child:
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        listProducts[index]['name']

                                    ),
                                    const SizedBox(
                                        width: 15.0),
                                    Text(
                                        listProducts[index]['quantity'].toString()
                                    ),
                                    const SizedBox(
                                        width: 15.0),
                                    Text(
                                        '${listProducts[index]['buy'].toString()} UM'
                                    ),
                                    const SizedBox(
                                        width: 15.0),
                                    Text('${listProducts[index]['sell'].toString()} UM'
                                    ),
                                    const SizedBox(
                                        width: 15.0),




                                    Checkbox(

                                      value:listProducts[index]['value']==0?false:true,

                                        onChanged:  (value)async{
                                          if (kDebugMode) {
                                            print(value);
                                            print(listProducts[index]['value']);

                                          }
                                          setState((){});
                                          await  LoginCubit.get(context).updateSelected(value: value,
                                              id: listProducts[index]['id']);

                                        },

                                      activeColor: Colors.green,



                                    ),


                                    Expanded(
                                      child: TextButton(
                                   onPressed: (){

                                      Navigator.push(
                                        context,MaterialPageRoute(builder:(context)=>
                                          ProductsEdit(

                                          idproduct:listProducts[index]['id'].toString(),
                                          nameProduct:listProducts[index]['name'],
                                          quantity:listProducts[index]['quantity'],
                                          description:listProducts[index]['description'],
                                          image:listProducts[index]['image'],
                                            buy: listProducts[index]['buy'].toString(),
                                            sell: listProducts[index]['sell'].toString(),
                                      )
                                          ),

                                          );
                                        },
                                        child: const Text(
                                            'Edit'),
                                      ),

                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                        )
                    );

                  }

                ),
              fallback: (context)=>const Center(
                child: CircularProgressIndicator(),
              ),

            ),
          ),
        );
        },

    );
  }

}
