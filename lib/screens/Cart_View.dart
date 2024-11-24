import 'package:cup_cakes/Animation/FadeAnimation.dart';
import 'package:cup_cakes/screens/Check_Out.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 60,
                width: 60,
              ),
              Text(
                "Toronto Cupcakes",
                style: TextStyle(
                    fontFamily: 'DancingScript',
                    color: Colors.brown,
                    fontSize: 40,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: PersistentShoppingCart().showCartItems(
                    cartTileWidget: ({required data}) =>FadeAnimation(
                      1.1,
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(data.productName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                  //fontFamily: 'DancingScript'
                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:150,
                                  width: 150,
                                  child: Image(image: AssetImage(data.productThumbnail.toString()),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //SizedBox(height: 10,),
                                        //Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //children: [
                                            Text("\$"+data.unitPrice.toString()+" per cupcake",style: TextStyle(
                                              fontSize: 13
                                            ),),
                                            SizedBox(height: 20,),
                                            Text("Subtotal : \$"+(data.unitPrice*data.quantity).toString(),style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold
                                            )),
                                            SizedBox(height: 20,),
                                            Container(
                                              height: 37,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.6),
                                                borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: TextButton(onPressed: (){
                                                PersistentShoppingCart().removeFromCart(data.productId);
                                              }, child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('Delete',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16
                                                    ),
                                                  ),
                                                  SizedBox(width: 7,),
                                                  Icon(Icons.delete,
                                                      color: Colors.white,
                                                    size: 18,

                                                  )
                                                ],
                                              )),
                                            )
                                            /*IconButton(onPressed:(){
                                              PersistentShoppingCart().removeFromCart(data.productId);
                                            },
                                              icon: Icon(Icons.delete,color: Colors.black,size: 25,),
                                            )*/
                                          //],
                                        //)
                                      ],
                                    )),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed:(){
                                      PersistentShoppingCart().incrementCartItemQuantity(data.productId);
                                    },
                                      icon: Icon(Icons.add_circle,size: 15,),
                                    ),
                                    Text(data.quantity.toString()),
                                    IconButton(onPressed:(){
                                      PersistentShoppingCart().decrementCartItemQuantity(data.productId);
                                    },
                                      icon: Icon(Icons.remove_circle,size: 15,),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                    showEmptyCartMsgWidget: Center(
                      child: FadeAnimation(
                        1.1,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,
                              size: 150,
                              color: Colors.brown.shade500
                            ),
                            Text("Your Cart is Empty",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ),
              PersistentShoppingCart().showTotalAmountWidget(
                  cartTotalAmountWidgetBuilder: (totalAmount){
                    return Visibility(
                        visible: totalAmount != 0.0,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Grand total : ',style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),),
                                Text('\$'+totalAmount.toString(),style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            SizedBox(
                              width: 260,
                              child: ElevatedButton(onPressed: (){
                                //PersistentShoppingCart().clearCart();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailsScreen()));
                              },
                                  style:ElevatedButton.styleFrom(
                                    primary: Colors.pink,
                                    onPrimary: Colors.white,
                                  ),
                                  child:Text('Place Order')
                              ),
                            ),
                            //SizedBox(height: 5,)
                          ],
                        ));
                  }
              )
            ],

          ),
        ),
      )
    );
  }
}
