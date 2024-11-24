/*import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';

class Cupcakes extends StatefulWidget {
  final String image;

  const Cupcakes({Key? key, required this.image}) : super(key: key);

  @override
  _CupcakesState createState() => _CupcakesState();
}

class _CupcakesState extends State<Cupcakes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: 'red',
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.contain
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400] ?? Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      /*Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeAnimation(
                            1.3,
                            Text(
                              "Chocolate Cupcake",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          /*FadeAnimation(
                            1.4,
                            Text(
                              "Size",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              FadeAnimation(
                                1.5,
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 20),
                                  child: Center(
                                    child: Text(
                                      '40',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                1.45,
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '42',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                1.46,
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 20),
                                  child: Center(
                                    child: Text(
                                      '44',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                1.47,
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 20),
                                  child: Center(
                                    child: Text(
                                      '46',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 60),*/
                          FadeAnimation(
                            1.5,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';

class Cupcakes extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String type;
  final String image;

  const Cupcakes({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.type,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: image,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
              SizedBox(height: 20),
              Text(
                name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Type: $type',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              Text(
                'Price: \$$price',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import '../Animation/FadeAnimation.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class Cupcakes extends StatelessWidget {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String type;
  final String image;
  final int totalQuantity;

  const Cupcakes({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.type,
    required this.image,
    required this.totalQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(width: 5,),
              Text(
                "Toronto Cupcakes",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  color: Colors.brown,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FadeAnimation(
            1.1,
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: image,
                      child: Image.asset(image, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20),
                    Text(
                      name,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.pink),
                    ),
                    SizedBox(height: 40),
                Text(
                  description ?? 'No description Available',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'DancingScript'

                  ),
                ),
                  SizedBox(height: 40),
                    Text(
                      'Price: \$$price',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ),
          PersistentShoppingCart().showAndUpdateCartItemWidget(
              inCartWidget: Container(
                height: 45,
                  width: 250,
                  child: Center(child: Text('Remove from Cart',style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),)),
                   decoration: BoxDecoration(
                     color: Colors.brown,
                     borderRadius: BorderRadius.circular(22.5)
                   ),
              ),
              notInCartWidget: Container(
                height: 45,
                width: 250,
                child: Center(child: Text('Add to Cart',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)),
                decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(22.5)
                ),
              ),
              product: PersistentShoppingCartItem(
                  productId: id,
                  productName: name,
                  productThumbnail: image,
                  productDescription: description,
                  unitPrice: price,
                  quantity: 1)
          ),
        ],
      ),
    );
  }
}*/




