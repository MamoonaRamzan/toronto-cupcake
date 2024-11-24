
/*import 'package:cup_cakes/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'Home_Page.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _senderNameController = TextEditingController();
  final _senderAddressController=TextEditingController();
  final _senderPhoneController = TextEditingController();
  final _senderEmailController = TextEditingController();
  final _commentsController = TextEditingController();

  bool _allFieldsFilled() {
    return _senderNameController.text.isNotEmpty &&
        _senderAddressController.text.isNotEmpty &&
        _senderPhoneController.text.isNotEmpty &&
        _senderEmailController.text.isNotEmpty &&
        _commentsController.text.isNotEmpty;
  }

  void _showSnackbar(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  void dispose() {
    _senderNameController.dispose();
    _senderPhoneController.dispose();
    _senderEmailController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

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
                height: 40,
                width: 40,
              ),
              Text(
                "Toronto Cupcakes",
                style: TextStyle(
                    fontFamily: 'DancingScript',
                    color: Colors.brown,
                    fontSize: 35,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/7.png'),
                opacity: 0.2
            ),
            color: Colors.pink.shade50.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: FadeAnimation(
            1.1,
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Center(
                  child: Text("Shipping Details",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text(
                      "Please Fill the Below Fields to Submit"
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _senderNameController,
                  decoration: InputDecoration(
                    labelText: 'Sender Name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderAddressController,
                  decoration: InputDecoration(
                    labelText: 'Sender Full Adress',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderPhoneController,
                  decoration: InputDecoration(
                    labelText: 'Sender Phone',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (value != null && value.isNotEmpty && !RegExp(r'^(?:\+92|0)?[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid Pakistani phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderEmailController,
                  decoration: InputDecoration(
                    labelText: 'Sender Email',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (value != null && value.isNotEmpty && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    labelText: 'Additional Comments',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLines: 5,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _allFieldsFilled() ? () {
                    PersistentShoppingCart().clearCart();
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    _showSnackbar('Your Order is placed successfully');
                  } : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:cup_cakes/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'Home_Page.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _senderNameController = TextEditingController();
  final _senderAddressController = TextEditingController();
  final _senderPhoneController = TextEditingController();
  final _senderEmailController = TextEditingController();
  final _commentsController = TextEditingController();

  bool _allFieldsFilled() {
    return _senderNameController.text.isNotEmpty &&
        _senderAddressController.text.isNotEmpty &&
        _senderPhoneController.text.isNotEmpty &&
        _senderEmailController.text.isNotEmpty &&
        _commentsController.text.isNotEmpty;
  }

  void _showSnackbar(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  void dispose() {
    _senderNameController.dispose();
    _senderAddressController.dispose();
    _senderPhoneController.dispose();
    _senderEmailController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

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
                height: 40,
                width: 40,
              ),
              Text(
                "Toronto Cupcakes",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  color: Colors.brown,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/7.png'),
            opacity: 0.2,
          ),
          color: Colors.pink.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: FadeAnimation(
            1.1,
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Center(
                  child: Text(
                    "Shipping Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text("Please Fill the Below Fields to Submit"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _senderNameController,
                  decoration: InputDecoration(
                    labelText: 'Sender Name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return value != null && value.isNotEmpty
                        ? null
                        : 'Please enter a valid name';
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderAddressController,
                  decoration: InputDecoration(
                    labelText: 'Sender Full Address',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return value != null && value.isNotEmpty
                        ? null
                        : 'Please enter a valid address';
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderPhoneController,
                  decoration: InputDecoration(
                    labelText: 'Sender Phone',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (value != null && value.isNotEmpty && !RegExp(r'^(?:\+92|0)?[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid Pakistani phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderEmailController,
                  decoration: InputDecoration(
                    labelText: 'Sender Email',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (value != null && value.isNotEmpty && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    labelText: 'Additional Comments',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLines: 5,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return value != null && value.isNotEmpty
                        ? null
                        : 'Please enter a comment';
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      PersistentShoppingCart().clearCart();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => HomePage()));
                      _showSnackbar('Your Order is placed successfully');
                    } else {
                      _showSnackbar('Please fill out all fields correctly');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
import 'package:cup_cakes/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'Home_Page.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _senderNameController = TextEditingController();
  final _senderAddressController = TextEditingController();
  final _senderPhoneController = TextEditingController();
  final _senderEmailController = TextEditingController();
  final _commentsController = TextEditingController();

  bool _allFieldsFilled() {
    return _senderNameController.text.isNotEmpty &&
        _senderAddressController.text.isNotEmpty &&
        _senderPhoneController.text.isNotEmpty &&
        _senderEmailController.text.isNotEmpty &&
        _commentsController.text.isNotEmpty;
  }

  void _showSnackbar(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  void dispose() {
    _senderNameController.dispose();
    _senderAddressController.dispose();
    _senderPhoneController.dispose();
    _senderEmailController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

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
                height: 40,
                width: 40,
              ),
              Text(
                "Toronto Cupcakes",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  color: Colors.brown,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/7.png'),
            opacity: 0.2,
          ),
          color: Colors.pink.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: FadeAnimation(
            1.1,
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Center(
                  child: Text(
                    "Shipping Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text("Please fill out the fields below to submit."),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _senderNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return value != null && value.isNotEmpty
                        ? null
                        : 'Please enter a valid name';
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderAddressController,
                  decoration: InputDecoration(
                    labelText: 'Full Address',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return value != null && value.isNotEmpty
                        ? null
                        : 'Please enter a valid address';
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderPhoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !RegExp(r'^(?:\+92|0)?[0-9]{10}$')
                            .hasMatch(value)) {
                      return 'Please enter a valid Pakistani phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senderEmailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    labelText: 'Additional Comments',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLines: 5,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    return value != null && value.isNotEmpty
                        ? null
                        : 'Please enter a comment';
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _allFieldsFilled()
                      ? () {
                    if (_formKey.currentState!.validate()) {
                      PersistentShoppingCart().clearCart();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      _showSnackbar(
                          'Your Order is placed successfully');
                    } else {
                      _showSnackbar(
                          'Please fill out all fields correctly');
                    }
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



