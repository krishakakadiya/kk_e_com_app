import 'package:flutter/cupertino.dart';
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
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: categories
                    .map(
                      (e) => SizedBox(
                        height: 60,
                        child: Column(
                          children: [
                            CircleAvatar(
                                // foregroundImage: NetworkImage(e),
                                ),
                            Text(e),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: products
                    .map(
                      (e) => Stack(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.symmetric(
                                vertical: 5, horizontal: 5),
                            height: size.height * 0.30,
                            width: size.width * 0.59,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 3,
                                    color: Colors.grey),
                              ],
                            ),
                            child: Image(
                              image: NetworkImage(
                                e['thumbnail'],
                              ),
                            ),
                          ),
                          IconButton(
                            alignment: AlignmentDirectional.topEnd,
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline_outlined),
                            color: Colors.black,
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(
                              e['title'],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
