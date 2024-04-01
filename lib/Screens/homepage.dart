import 'package:e_shopping/utills/all_product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? dropValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Homepage",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("Cartpage");
                });
              },
              child: Icon(
                Icons.shopping_cart,
                size: 25,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: DropdownButton(
                  padding: const EdgeInsets.all(10),
                  value: dropValue,
                  hint: const Text(
                    "Select Category..",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.cyan,
                    ),
                  ),
                  items: Product.allProductData.map((e) {
                    return DropdownMenuItem(
                      value: e['catagoryName'],
                      child: Text(
                        e['catagoryName'],
                      ),
                    );
                  }).toList(),
                  onChanged: (values) {
                    setState(() {
                      dropValue = values as String;
                    });
                  },
                ),
              )),
          Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(12),
                color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...Product.allProductData.map(
                        (e) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...e['categoryProducts'].map((index) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pushNamed(
                                              'Detailpage',
                                              arguments: index);
                                        });
                                      },
                                      child: Container(
                                        height: 320,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            index['thumbnail']),
                                                        fit: BoxFit.cover),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding: EdgeInsets.all(12),
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${index['title']}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Rs. ${index['price']}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            " OFF :",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.red,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          Text(
                                                            " ${index['discountPrecentage']} \%",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
