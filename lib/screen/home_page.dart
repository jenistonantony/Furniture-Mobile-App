import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furniture_mobile_app/components/colors.dart';
import 'package:furniture_mobile_app/demo.dart';
import 'package:furniture_mobile_app/screen/animation_page.dart';
import 'package:furniture_mobile_app/screen/food_Page.dart';
import 'package:furniture_mobile_app/screen/product_page.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();

  void getData() {
    product = [];
    products.forEach((action) {
      if (names[category].toLowerCase() == action["category"]) {
        product.add(Product.fromJson(action));
        log("dummy ${action}");
      } else if (names[category] == "All") {
        product.add(Product.fromJson(action));
      } else {
        product = [];
      }
      setState(() {
        // Product.fromJson(action);
      });
    });
  }

  List<Product> product = [];

  List<String> names = [
    "All",
    "Chair",
    "Table",
    "Office Desk",
    "Dining Set",
    "Coffee Set"
  ];

  List<Map<String, dynamic>> products = [
    {"name": "\$199", "image": "assets/images/image1.png", "category": "chair"},
    {"name": "\$189", "image": "assets/images/image2.png", "category": "table"},
    {"name": "\$179", "image": "assets/images/image3.png", "category": "chair"},
    {"name": "\$169", "image": "assets/images/image4.png", "category": "chair"},
    {"name": "\$159", "image": "assets/images/image5.png", "category": "chair"},
    {"name": "\$149", "image": "assets/images/image2.png", "category": "chair"},
  ];
  int category = 0;
  @override
  void initState() {
    products.forEach((action) {
      product.add(Product.fromJson(action));
      log("products ${action}");
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            ),
            // const SizedBox(width: 90),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "FurniL",
                    style: TextStyle(
                        color: primarycolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: "ux",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                category = index;
                                getData();
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      // style: BorderStyle.solid,
                                      color: category == index
                                          ? Colors.orange
                                          : Colors.grey.shade300),
                                  // color: category == index
                                  //     ? Colors.orange
                                  //     : Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  names[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: category == index
                                        ? Colors.orange
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 249, 249),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductPage()));
                          },
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 241, 245),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(100),
                                    left: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                          "assets/images/image5.png")),
                                  Text(
                                    'Flash Sale',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 110,
                                decoration: const BoxDecoration(),
                                child: const Text(
                                  "Get your Special sale up to 50%",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: 35,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: primarycolor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Shop Now",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 650,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 100,
                      ),
                      child: ResponsiveGridList(
                        listViewBuilderOptions: ListViewBuilderOptions(
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                        minItemsPerRow: 2,
                        horizontalGridMargin: 10,
                        verticalGridMargin: 10,
                        minItemWidth: 100,
                        children: List.generate(
                          6,
                          (index) {
                            if (index < product.length) {
                              return Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 253, 248, 248),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      product[index].image,
                                      height: 170,
                                    ),
                                    Center(child: Text(product[index].name)),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text('Product not available')),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
