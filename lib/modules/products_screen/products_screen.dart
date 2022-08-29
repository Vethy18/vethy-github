
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/modules/products_edit/produts_edit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cado/shared/cubit/states.dart';
import '../../shared/components/constant.dart';
import '../products_add/addproduct.dart';
import '../selecteditem/selected_product.dart';

class ProductsScreen extends StatefulWidget {
   const ProductsScreen({Key? key,}) : super(key: key);


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

var searchController=TextEditingController();

 // List<ProductsScreen> selected=[];



List  selected= [];
List  selectedl= [];

List idSelected = [];

@override
  void initState()
{
  // listProducts.forEach((element) {
  //   selectedl.add({'id':element.id,'name':element.name,'value':false,'image':element.image,'quantity':element.quantity,'description':element.description,'sell':element.sell,'buy':element.buy});
  // });


    // print('------------list-----------');
    // for(int i=0; i < listProducts.length; i++){
    //   print(listProducts[i]['id']);
    //   products.add({'id':listProducts[i]['id'],'name':listProducts[i]['name'],
    //   'value':false,'image':listProducts[i]['image'],
    //   'quantity':listProducts[i]['quantity'],
    //   'description':listProducts[i]['description'],
    //   'sell':listProducts[i]['sell'],
    //   'buy':listProducts[i]['buy']});
    //
    // }
    for(int i=1; i < listProducts.length; i++){
      setState((){
        selectedl.add({'id':listProducts[i]['id'],
          'name':listProducts[i]['name'],
          'value':false,'image':listProducts[i]['image'],
          'quantity':listProducts[i]['quantity'],
          'description':listProducts[i]['description'],
          'sell':listProducts[i]['sell'],
          'buy':listProducts[i]['buy']});

      });

  }


    // print(selectedl);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is InsertProductToDataBaseState)
          {

          }

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
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> SelectedItem(
                      list: selected,



                    )));
                print(idSelected);
            },
            child: const Icon(
               Icons.shopping_cart
            ),
          ),

          body:SafeArea(

            child: ConditionalBuilder(
              condition:selectedl.isNotEmpty,
              builder: (context)=>ListView.builder(itemCount: selectedl.length,

                  itemBuilder:
                   (context, index) {



                    // return Card(
                    //     child:
                    //     Padding(
                    //       padding: const EdgeInsets.all(10.0),
                    //       child: SingleChildScrollView(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Text(
                    //                     listProducts[index]['name']
                    //
                    //                 ),
                    //                 const SizedBox(
                    //                     width: 15.0),
                    //                 Text(
                    //                     listProducts[index]['quantity'].toString()
                    //                 ),
                    //                 const SizedBox(
                    //                     width: 15.0),
                    //                 Text(
                    //                     '${listProducts[index]['buy'].toString()} UM'
                    //                 ),
                    //                 const SizedBox(
                    //                     width: 15.0),
                    //                 Text('${listProducts[index]['sell'].toString()} UM'
                    //                 ),
                    //                 const SizedBox(
                    //                     width: 15.0),
                    //
                    //
                    //                 Checkbox(
                    //
                    //                   value:listProducts[index]['value']==0?false:true,
                    //
                    //                     onChanged:  (value)async{
                    //                       if (kDebugMode) {
                    //                         print(value);
                    //                         print(listProducts[index]['value']);
                    //
                    //                       }
                    //                       setState((){});
                    //                       await  LoginCubit.get(context).updateSelected(value: value,
                    //                           id: listProducts[index]['id']);
                    //
                    //                     },
                    //
                    //                   activeColor: Colors.green,
                    //
                    //
                    //
                    //                 ),
                    //
                    //
                    //                 Expanded(
                    //                   child: TextButton(
                    //                onPressed: (){
                    //
                    //                   Navigator.push(
                    //                     context,MaterialPageRoute(builder:(context)=>
                    //                       ProductsEdit(
                    //
                    //                       idproduct:listProducts[index]['id'].toString(),
                    //                       nameProduct:listProducts[index]['name'],
                    //                       quantity:listProducts[index]['quantity'],
                    //                       description:listProducts[index]['description'],
                    //                       image:listProducts[index]['image'],
                    //                         buy: listProducts[index]['buy'].toString(),
                    //                         sell: listProducts[index]['sell'].toString(),
                    //                   )
                    //                       ),
                    //
                    //                       );
                    //                     },
                    //                     child: const Text(
                    //                         'Edit'),
                    //                   ),
                    //
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //
                    //       ),
                    //     )
                    // );
                     return selectedProduct(selectedl[index],index,selectedl[index]['value']);


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

Widget selectedProduct(listProduct,index,bool value)  {
  return  Card(
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
                      listProduct['name']

                  ),
                  const SizedBox(
                      width: 15.0),
                  Text(
                      listProduct['quantity'].toString()
                  ),
                  const SizedBox(
                      width: 15.0),
                  Text(
                      '${listProduct['buy'].toString()} UM'
                  ),
                  const SizedBox(
                      width: 15.0),
                  Text('${listProduct['sell'].toString()} UM'
                  ),
                  const SizedBox(
                      width: 15.0),



                  GestureDetector(
                    child: value?const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ):const Icon(
                      Icons.check_circle_outline,
                      color: Colors.grey,
                    ),
                    onTap: (){
                      setState((){
                        selectedl[index]['value'] = !selectedl[index]['value'];
                        if(selectedl[index]['value'] ==true){
                          selected?.add({'id':selectedl[index]['id'],
                            'name':selectedl[index]['name'],
                            'value':true,'image':selectedl[index]['image'],
                            'quantity':selectedl[index]['quantity'],
                            'description':selectedl[index]['description'],
                            'sell':selectedl[index]['sell'],
                            'buy':selectedl[index]['buy']});

                          print(selected);

                        }
                        else if(selectedl[index]['value'] ==false){
                          selected?.removeWhere((element) => element['id'] == selectedl[index]['id']);
                          print(selected);
                        }

                      });

                    },

                  ),


                  Expanded(
                    child: TextButton(
                      onPressed: (){

                        Navigator.push(
                          context,MaterialPageRoute(builder:(context)=>
                            ProductsEdit(

                              idproduct:listProduct['id'].toString(),
                              nameProduct:listProduct['name'],
                              quantity:listProduct['quantity'],
                              description:listProduct['description'],
                              image:listProduct['image'],
                              buy: listProduct['buy'].toString(),
                              sell: listProduct['sell'].toString(),
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
}
