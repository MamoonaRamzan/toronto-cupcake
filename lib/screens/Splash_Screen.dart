
/*import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';
import 'Home_Page.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CarouselSlider(
            items: [
              Container(
                //color: Colors.black,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image:AssetImage('assets/images/logo.png'),
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(width: 10,),
                          Text("Toronto Cupcakes",
                            style: TextStyle(
                                fontFamily: 'DancingScript',
                                decoration: TextDecoration.none,
                                color: Colors.brown,
                                fontSize: 35,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Image(image: AssetImage('assets/images/4.png'),
                        height: 340,
                        width: 500,
                      ),
                      Text("We are driven by loving what we do and what we make everyday.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'DancingScript',
                            color: Colors.pink,
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                            //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
              ),
              Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image:AssetImage('assets/images/logo.png'),
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(width: 10,),
                          Text("Toronto Cupcakes",
                            style: TextStyle(
                                fontFamily: 'DancingScript',
                                decoration: TextDecoration.none,
                                color: Colors.brown,
                                fontSize: 35,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Image(image: AssetImage('assets/images/2.png'),
                        height: 340,
                        width: 500,
                      ),
                      Text("We get to use the finest ingredients to make what we believe are the tastiest treats around.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'DancingScript',
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                          fontSize: 22
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image:AssetImage('assets/images/logo.png'),
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(width: 10,),
                          Text("Toronto Cupcakes",
                            style: TextStyle(
                                fontFamily: 'DancingScript',
                                decoration: TextDecoration.none,
                                color: Colors.brown,
                                fontSize: 35,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Image(image: AssetImage('assets/images/3.png'),
                        height: 340,
                        width: 500,
                      ),
                      Text("we love the idea that our treats are making people happy every time they bite into one.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'DancingScript',
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  )
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 0.6
            ),
            carouselController: _controller,
          ),
            //SizedBox(height: 40,),
      Center(child: SliderButton(
        action: () async{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()
            ),
          );
          return true;
        },
        buttonColor: Colors.pink,
backgroundColor: 	Color(0xffececec),
        baseColor: Colors.pink,
        height: 60,
        width: 210,
        buttonSize: 60,
        label: Text(
          "  Slide to Continue",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              fontSize: 13),
        ),
        icon: Icon(Icons.home,
          size: 35,
          color: Colors.white,
        )
      )),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';
import 'Home_Page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape = size.width > size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: CarouselSlider(
                items: [
                  _buildCarouselItem(
                    context,
                    'assets/images/logo.png',
                    'Toronto Cupcakes',
                    'assets/images/4.png',
                    "We are driven by loving what we do and what we make everyday.",
                    size,
                    isLandscape,
                  ),
                  _buildCarouselItem(
                    context,
                    'assets/images/logo.png',
                    'Toronto Cupcakes',
                    'assets/images/2.png',
                    "We get to use the finest ingredients to make what we believe are the tastiest treats around.",
                    size,
                    isLandscape,
                  ),
                  _buildCarouselItem(
                    context,
                    'assets/images/logo.png',
                    'Toronto Cupcakes',
                    'assets/images/3.png',
                    "We love the idea that our treats are making people happy every time they bite into one.",
                    size,
                    isLandscape,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: isLandscape ? 1.5 : 0.6,
                ),
                carouselController: _controller,
              ),
            ),
            Center(
              child: SliderButton(
                action: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  return true;
                },
                buttonColor: Colors.pink,
                backgroundColor: Color(0xffececec),
                baseColor: Colors.pink,
                height: 60,
                width: 195,
                buttonSize: 60,
                label: Text(
                  "Slide to Continue",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontSize: 13,
                  ),
                ),
                icon: Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context,
      String logoPath,
      String title,
      String imagePath,
      String description,
      Size size,
      bool isLandscape,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isLandscape ? 40.0 : 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                logoPath,
                height: size.height * 0.1,
                width: size.width * 0.1,
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  decoration: TextDecoration.none,
                  color: Colors.brown,
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Image.asset(
            imagePath,
            height: size.height * 0.4,
            width: size.width * 0.8,
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'DancingScript',
              color: Colors.pink,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

