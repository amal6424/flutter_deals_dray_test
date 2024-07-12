import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
          ),
          textTheme: TextTheme(

          )
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Deals Dray"),
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (context){
                return IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu));
              },
            ),

          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color:Colors.blue),
                  child: Text("DrawerHeader"),
                ),
                ListTile(title: Text("Item 1"),
                onTap: (){
                  Navigator.pop(context);
                },)
              ],
            ),
          ),
          body: homeBody(context),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: "Catogories"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer),
                  label: "Deals"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  label: "Profile"
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.red,
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.message, color: Colors.white,),
                  Text("Chat", style: TextStyle(color: Colors.white),)
                ],
              ),
            )
          ),
        ),
    );
  }

  Widget homeBody(context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            topBanners(),
            secondRow(),
            thirdRow()
          ],
        ),
      ),
    );
  }

  Widget thirdRow(){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          )
      ),
      child: Column(
        children: [
          Text("Exclusive For You", style: TextStyle(fontSize: 25, color: Colors.white,),textAlign: TextAlign.center,),
          Container(
            child: bottomBanners(),
          )
        ],
      ),
    );
  }
  Widget secondRow(){
    return Row(
      children: [
      Column(
        children: [
          Image.asset("assets/images/mobile.png",width: 70, height: 70,),
          Text("Mobile")
        ],
      ),
      Column(
        children: [
          Image.asset("assets/images/laptop.png",width: 70, height: 70,),
          Text("Laptop")
        ],
      ),
      Column(
        children: [
          Image.asset("assets/images/camera.png",width: 70, height: 70,),
          Text("Camera")
        ],
      ),
      Column(
        children: [
          Image.asset("assets/images/led.png",width: 70, height: 70,),
          Text("LED")
        ],
      )
    ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
  CarouselSlider bottomBanners(){
    return CarouselSlider(
      options: CarouselOptions(
          height: 600,
          autoPlay: false
      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset("assets/images/nokia.png",width: 400,height: 500,),
                      Text("Nokia")
                    ],
                  ),
                )
            );
          },
        );
      }).toList(),
    );
  }
  CarouselSlider topBanners(){
    return CarouselSlider(
      options: CarouselOptions(
          height: 150,
          autoPlay: true
      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                ),
                child: FittedBox(
                  child: Image.asset("assets/images/nokia_ad.png"),
                  fit: BoxFit.fill,
                )

            );
          },
        );
      }).toList(),
    );
  }
}