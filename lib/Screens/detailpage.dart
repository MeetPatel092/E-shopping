import 'package:e_shopping/utills/all_product_data.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  var data;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data2 =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context)
                        .pushNamed("Cartpage", arguments: data2);
                  });
                },
                child: Icon(Icons.shopping_cart),
              )),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  data2['images'].length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      '${data2['images'][index]}',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      height: 480,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 370,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Colors.grey,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 15, right: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${data2['title']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Text(
                        "\$ ${data2['price']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${data2['discountPrecentage']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${data2['category']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data2['description']}..",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Product.addtoCart.add(data2);
            Product.ConvertData();
          });
        },
        elevation: 2,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
