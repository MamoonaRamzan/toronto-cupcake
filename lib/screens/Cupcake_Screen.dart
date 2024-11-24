
import 'package:cup_cakes/model/Item_Model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import '../Animation/FadeAnimation.dart';

class Cupcake_Screen extends StatefulWidget {
  @override
  State<Cupcake_Screen> createState() => _Cupcake_ScreenState();
}

class _Cupcake_ScreenState extends State<Cupcake_Screen> {
  final List<ItemModel> cupcakes = [
    ItemModel(
      productId: '1',
      productName: 'Chocolate Peanut Butter',
      productDescription: 'Chocolate cupcakes with sweet PB frosting topped with a hand made PB cup wedge',
      productType: 'Always Available',
      productImage: 'assets/images/chocolatepeanutbutter.png',
      unitPrice: 3.75,
      totalQuantity: 50
    ),
    ItemModel(
        productId: '2',
        productName: 'Chocolate Hazelnut',
        productDescription: 'Chocolate cupcake topped with chocolate ganche and caramelized hazelnuts',
        productType: 'Always Available',
        productImage: 'assets/images/chocolatehazelnut.png',
        unitPrice: 3,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '3',
        productName: 'Chocolate Vanilla cupcake',
        productDescription: 'Vanilla cupcake topped with vanilla frosting and a hand crafted fondant flower',
        productType: 'Always Available',
        productImage: 'assets/images/chocolatevanilla.png',
        unitPrice: 3.8,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '4',
        productName: 'Red Velvet Cupcake',
        productDescription: 'Classic US southern red velvet cupcake with a vanilla cream cheese frosting topped with red and white chocolate curls',
        productType: 'Always Available',
        productImage: 'assets/images/redvelvet.png',
        unitPrice: 3.5,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '5',
        productName: 'Valentines Day Cupcake',
        productDescription: '',
        productType: 'Holidays',
        productImage: 'assets/images/toronto_12_valentines.png',
        unitPrice: 3.8,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '6',
        productName: 'Mothers Day Cupcake',
        productDescription: '',
        productType: 'Holidays',
        productImage: 'assets/images/Toronto_Mothers_Day_Dozen.png',
        unitPrice: 3.5,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '7',
        productName: 'All that Jazz',
        productDescription: '',
        productType: 'Special Events',
        productImage: 'assets/images/jazz.png',
        unitPrice: 3.5,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '8',
        productName: 'Light Camera Action',
        productDescription: '',
        productType: 'Special Events',
        productImage: 'assets/images/Tiff.png',
        unitPrice: 3.5,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '9',
        productName: 'Custom Cupcake',
        productDescription: '',
        productType: 'Customs',
        productImage: 'assets/images/custom1.png',
        unitPrice: 3.9,
        totalQuantity: 50
    ),
    ItemModel(
        productId: '10',
        productName: 'Custom Image Cupcake',
        productDescription: '',
        productType: 'Customs',
        productImage: 'assets/images/Face.png',
        unitPrice: 3.9,
        totalQuantity: 50
    ),

    // Add more cupcake data here
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: [
                Tab(text: "Always Available"),
                Tab(text: "Holidays"),
                Tab(text: "Special Events"),
                Tab(text: "Customs"),
              ],
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            cupcakeList(context, 'Always Available'),
            cupcakeList(context, 'Holidays'),
            cupcakeList(context, 'Special Events'),
            cupcakeList(context, 'Customs'),
          ],
        ),
      ),
    );
  }

  Widget cupcakeList(BuildContext context, String type) {
    return SingleChildScrollView(
      child: Column(
        children: cupcakes
            .where((cupcake) => cupcake.productType == type)
            .map((cupcake) => makeItem(context, cupcake))
            .toList(),
      ),
    );
  }

  Widget makeItem(BuildContext context, ItemModel cupcake) {
    return FadeAnimation(
      1.1,
      Card(
        //color: Colors.pink.shade50.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          width: 250,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(image: AssetImage(cupcake.productImage),
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10,),
              Text(cupcake.productName,
                textAlign: TextAlign.start,
                style: TextStyle(
                color: Colors.brown,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                //fontFamily: 'DancingScript'
              ),),
              /*Text(cupcake.productDescription ?? 'Description not Available',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.pink,
                  fontWeight: FontWeight.w400,
                  //fontFamily: 'DancingScript'
                ),
              ),*/
              Text('Price : \$'+cupcake.unitPrice.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400                  ),
              ),
              PersistentShoppingCart().showAndUpdateCartItemWidget(
                  inCartWidget: Container(
                    height: 40,
                    width: 190,
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Remove from Cart',style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_bag_rounded,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    )),
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(22.5)
                    ),
                  ),
                  notInCartWidget: Container(
                    height: 40,
                    width: 150,
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add to Cart',style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_bag_rounded,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    )),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(22.5)
                    ),
                  ),
                  product: PersistentShoppingCartItem(
                      productId: cupcake.productId,
                      productName: cupcake.productName,
                      productThumbnail: cupcake.productImage,
                      productDescription: cupcake.productDescription,
                      unitPrice: cupcake.unitPrice,
                      quantity: 1)
              ),
            ],
          ),
        ),
      ),
    );
  }
}









