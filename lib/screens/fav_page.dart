import 'package:flutter/material.dart';
import 'package:kk_e_com_app/utils/products.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favourite Items"),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: fav
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {},
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            (!fav.contains(e))
                                ? IconButton(
                              onPressed: () {
                                fav.add(e);
                                setState(() {});
                              },
                              icon: Icon(Icons.favorite_border_outlined),
                              iconSize: 35,
                            )
                                : IconButton(
                              onPressed: () {
                                fav.remove(e);
                                setState(() {});
                              },
                              icon: Icon(Icons
                                  .favorite),
                              iconSize: 35,
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
    );
  }
}
