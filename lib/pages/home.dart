import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class MyHome extends StatefulWidget {
  Faker faker = Faker();

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(20, (index) {
      return Product(
        faker.food.restaurant(),
        "https://picsum.photos/id/$index/200",
        10000 + Random().nextInt(100000),
        faker.lorem.sentence()
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Model'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].imageURL),
            footer: Container(
              height: 68,
              color: Colors.blue.withOpacity(0.8),
              child: Column(
                children: [
                  Text(dummyData[index].judul,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  ),
                  Text("Rp ${dummyData[index].harga}",
                  textAlign: TextAlign.center,
                  ),
                  Text(dummyData[index].deskripsi, maxLines: 1,
                  textAlign: TextAlign.center,
                  ),
                ],
              ),
            ), 
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
