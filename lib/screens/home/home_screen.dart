import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  final Map<String,dynamic> _homeItems;
  const HomeScreen({super.key, required Map<String,dynamic> homeItems}):_homeItems = homeItems;
  @override
  State<HomeScreen> createState()=>_HomeScreenState(homeItems: _homeItems);
}
class _HomeScreenState extends State<HomeScreen>{
  final Map<String,dynamic> _homeItems;
  _HomeScreenState({required Map<String, dynamic> homeItems}):_homeItems = homeItems;
  @override
  void initState(){
    super.initState();

  }
  AppBar _getAppBar(){
    return AppBar(title: const Text("DealsDray"),);
  }
  Drawer _getDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color:Colors.blue),
            child: Text("DrawerHeader"),
          ),
          ListTile(title: const Text("Hello"),
            onTap: (){
              Navigator.pop(context);
            },)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: _getAppBar(),
        drawer: _getDrawer(),
        body: _homeBody(context),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          items: const [
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
            child: const Center(
              child: Row(
                children: [
                  Icon(Icons.message, color: Colors.white,),
                  Text("Chat", style: TextStyle(color: Colors.white),)
                ],
              ),
            )
        ),
      );
  }

  Widget _homeBody(context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            _topBanners(),
            _secondRow(),
            _thirdRow()
          ],
        ),
      ),
    );
  }

  Widget _thirdRow(){
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          )
      ),
      child: Column(
        children: [
          const Text("Exclusive For You", style: TextStyle(fontSize: 25, color: Colors.white,),textAlign: TextAlign.center,),
          Container(
            child: _bottomBanners(),
          )
        ],
      ),
    );
  }
  Widget _secondRow(){
    List<dynamic> category = _homeItems['data']['category'];
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: category.map((model)=>Column(
          children: [
            Image.network(model['icon']),
            Text(model['label'])
          ],
        )).toList(),
      ),
    );
  }
  CarouselSlider _bottomBanners(){
    List<dynamic> products = _homeItems['data']['categories_listing'];
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
          height: 350,
          autoPlay: false
      ),
      items: products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: width - 250,
                        height: 300,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(product['icon']),
                        ),
                      ),
                      Text(product['label'])
                    ],
                  ),
                )
            );
          },
        );
      }).toList(),
    );
  }
  CarouselSlider _topBanners(){
    List<dynamic> banners = _homeItems['data']['banner_one'];
    return CarouselSlider(
      options: CarouselOptions(
          height: 150,
          autoPlay: true
      ),
      items: banners.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(banner['banner']),
                )

            );
          },
        );
      }).toList(),
    );
  }
}