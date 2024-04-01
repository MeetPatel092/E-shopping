import 'package:e_shopping/utills/all_product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> Data1 =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pop("Detailpage");
            });
            ;
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            color: Colors.greenAccent,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            height: 700,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 3,
                    color: Colors.grey,
                    offset: Offset(-5, 0),
                  )
                ]),
            height: 750,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...Product.allCartData.map((e) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 15,
                                      spreadRadius: 3,
                                      color: Colors.grey,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Data1['thumbnail']),
                                                fit: BoxFit.cover)),
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "${Data1['title']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "\$ ${Data1['price']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Product.allCartData
                                                      .remove(Data1);
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price: ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$ ${Product.totalPrice()}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
