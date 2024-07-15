import 'package:flutter/material.dart';
import 'package:kk_e_com_app/utils/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('fav_page');
            },
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('cart_page');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...categoryI
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 170,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      e,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "All Products",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: products
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('detail_page');
                              arguments:
                              e;
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: NetworkImage(e['thumbnail']),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e['title'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 23),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "\$ ${e['price']}".toString(),
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Stock ${e['stock']}".toString(),
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      (!cart.contains(e))
                                          ? IconButton(
                                              onPressed: () {
                                                cart.add(e);
                                                setState(() {});
                                              },
                                              icon: Icon(Icons
                                                  .add_shopping_cart_rounded),
                                              iconSize: 35,
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                cart.remove(e);
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.done_outlined),
                                              iconSize: 35,
                                            ),
                                      (!fav.contains(e))
                                          ? IconButton(
                                              onPressed: () {
                                                fav.add(e);
                                                setState(() {});
                                              },
                                              icon: Icon(Icons
                                                  .favorite_border_outlined),
                                              iconSize: 35,
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                fav.remove(e);
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.favorite),
                                              iconSize: 35,
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
