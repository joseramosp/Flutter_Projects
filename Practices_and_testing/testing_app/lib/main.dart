// SHOE SHOPPING APP

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ShoppingCart()));
}

class SneakerModel {
  String img;
  String name;
  String model;
  int price;
  String desc;
  int rate;

  SneakerModel(
      {this.img, this.name, this.model, this.price, this.desc, this.rate});
}

class ShoppingCart extends StatefulWidget {
  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  List<SneakerModel> sneakers = List<SneakerModel>();
  int sneakersCount = 0;

  @override
  void initState() {
    super.initState();

    sneakers.addAll([
      SneakerModel(
          img:
              'https://cdn11.bigcommerce.com/s-lpasbs8kks/images/stencil/550x760/products/155/769/TK1-0002-profile__35378.1526591095.png?c=2',
          name: 'TRUEknit',
          model: 'One-Piece Upper',
          price: 129,
          desc:
              'The knit is a golf shoe unlike any other. You\'ll lace these up for your next round and not want to take them off the rest of the day. They will not end up being your favorite golf shoe, they\'ll be your favorite shoe period as they seamlessly transition from the links to everyday life.',
          rate: 5),
      SneakerModel(
          img:
              'https://cdn11.bigcommerce.com/s-lpasbs8kks/images/stencil/550x760/products/155/776/TK1-0003-profile__66532.1526591137.png?c=2',
          name: 'TRUE knit x Linksoul',
          model: 'Linksouldier',
          price: 148,
          desc:
              'The Build: The TRUE water repellent treatment will keep your feet dryer on those dewy mornings, as water will bead up on the outer shell of the shoe like magic.',
          rate: 4),
      SneakerModel(
          img:
              'https://cdn11.bigcommerce.com/s-lpasbs8kks/images/stencil/550x760/products/132/552/OG1-0003-profile__03115.1502824857.png?c=2',
          name: 'TRUE Major',
          model: 'TRUE Major',
          price: 150,
          desc:
              'Our first ever Tour Issue shoe has arrived in style. Major is our finest crafted performance shoe to date. Inspired by years of discussion with our Player Advisory Board, the Major is truly inspired, tested and built to spec for some of the greatest players on earth - and now, worn by the rest of us.',
          rate: 5),
      SneakerModel(
          img:
              'https://cdn11.bigcommerce.com/s-lpasbs8kks/images/stencil/550x760/products/169/874/TK1-0004-profile__52539.1526591216.1280.1280__60854.1526956045.png?c=2',
          name: 'TRUE TL-01',
          model: 'TRUE TL-01',
          price: 149,
          desc:
              'Introducing the TL-01. A shoe created to seamlessly transition from the office to the links and everywhere in between. Crafted from the finest weatherproof full grain Nappa leather, the TL-01 is durable and stylish enough for any endeavor.',
          rate: 3),
      SneakerModel(
          img:
              'https://www.run4it.com/media/catalog/product/m/a/mag2ar4561-400-m-nike-flyknit-sideright_2.png',
          name: 'TRUEKnit Original',
          model: 'Original',
          price: 150,
          desc:
              'The ultimate crossover returns in Night Camo form; the TL-01 features a classic silhouette that pairs well at the course or office. The charcoal suede upper and multi-color camo detailing round out the look that\'s sure to turn heads.',
          rate: 4),
      SneakerModel(
          img:
              'https://cdn11.bigcommerce.com/s-lpasbs8kks/images/stencil/1280x1280/products/206/1542/OGP-5555-profile__67771.1565991814.png?c=2&imbypass=on',
          name: 'TRUE OG Premium',
          model: 'TRUE OG Premium',
          price: 140,
          desc:
              'The OGP ultra supple full grain leather, new breathable and waterproof construction, forever cushioned PU inserts, and microsuede insert top all come together for our finest shoe yet. Our Topcut Venezian Waterproof leather boasts crazy comfort as it instantly molds to your feet and gets even better with time, revealing it\'s natural character.',
          rate: 0),
      SneakerModel(
          img:
              'https://cdn11.bigcommerce.com/s-lpasbs8kks/images/stencil/1280x1280/products/213/1272/TK1-MSstrong-Profile__33316.1552504799.png?c=2&imbypass=on',
          name: 'TRUE Women Knit',
          model: 'TRUE Women Knit',
          price: 125,
          desc:
              'The wait is finally over and thank you for your patience! The knit, a golf shoe unlike any other, is now available for women! You\'ll lace these up for your next summer round, and not want to take them off the rest of the day. They will not end up being your favorite golf shoe, they\'ll be your favorite shoe period as they seamlessly transition from the links to everyday life.',
          rate: 0),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
            backgroundColor: Colors.grey.withOpacity(0.05),
            iconTheme: IconThemeData(color: Colors.red),
            elevation: 0),
        body: Container(
            color: Colors.grey.withOpacity(0.05),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Shoe Shopping',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 45,
                                padding: EdgeInsets.all(10),
                                child: Text('${sneakersCount}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)))
                          ])),
                  Expanded(
                      child: ListView.builder(
                          itemCount: sneakers.length,
                          itemBuilder: (context, index) => GestureDetector(
                              child: SneakerWidget(
                                  sneaker: sneakers[index],
                                  onShop: () => setState(() {
                                        sneakersCount = sneakersCount + 1;
                                      })),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SneakerDetails(
                                            model: sneakers[index])));
                              })))
                ])));
  }
}

class SneakerWidget extends StatelessWidget {
  VoidCallback onShop;
  SneakerModel sneaker;

  SneakerWidget({this.sneaker, this.onShop});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Stack(children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 100),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 250,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Stack(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${sneaker.name}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('${sneaker.model}',
                              style: TextStyle(color: Colors.grey))
                        ]),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('\$ ${sneaker.price}',
                                style: TextStyle(color: Colors.white)))),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              width: 50,
                              height: 50,
                              child:
                                  Icon(Icons.shopping_cart, color: Colors.grey),
                            ),
                            onPressed: () {
                              this.onShop();
                            }))
                  ])),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: 250,
                      height: 250,
                      child: Hero(
                          child: Image.network(sneaker.img),
                          tag: sneaker.name)))
            ])));
  }
}

class SneakerDetails extends StatelessWidget {
  SneakerModel model;

  SneakerDetails({this.model});

  List<Widget> getRating() {
    List<Widget> icons = List<Widget>();
    for (var i = 0; i < model.rate; i++) {
      icons.add(Padding(
        child: Icon(Icons.star, color: Colors.red, size: 20),
        padding: EdgeInsets.only(bottom: 20),
      ));
    }

    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey.withOpacity(0.05),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey)),
        body: Container(
            color: Colors.grey.withOpacity(0.05),
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      width: 400,
                      height: 350,
                      child: Hero(
                          child: Image.network(model.img), tag: model.name)),
                  Row(children: getRating()),
                  Text(model.name,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text(model.model,
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                  SizedBox(height: 10),
                  Text(model.desc),
                  SizedBox(height: 20),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.red,
                      onPressed: () {},
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('Shop Sneakers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))))
                ])));
  }
}
