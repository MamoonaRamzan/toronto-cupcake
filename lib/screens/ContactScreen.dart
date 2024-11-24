import 'package:cup_cakes/Animation/FadeAnimation.dart';
import 'package:cup_cakes/screens/Home_Page.dart';
import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {
  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isFormValid() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _messageController.text.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text);
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
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
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
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/7.png'),
            opacity: 0.2
          ),
          color: Colors.pink.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)
        ),
        child: FadeAnimation(
          1.1,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Center(
                    child: Text("Contact Us",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Submit the form below or shoot us an email -',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'inquiry@torontocupcake.com',
                    style: TextStyle(color: Colors.pink, fontSize: 18,decoration: TextDecoration.underline, decorationColor: Colors.pink),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
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
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Message',
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
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isFormValid() ? () {
                      if (_formKey.currentState!.validate()) {
                        _nameController.clear();
                        _messageController.clear();
                        _emailController.clear();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        _showSnackbar('Message sent successfully');
                      }
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
      ),
    );
  }
}
