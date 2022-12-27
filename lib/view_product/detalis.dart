import 'package:flutter/material.dart';

class Detalis extends StatelessWidget {
  Detalis({super.key, required this.productData});

  var productData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 500,
      width: 700,
      // shadowColor: Colors.yellow,
      child: ListTile(
        title: Image.network(
          productData['product_image'],
          height: 450,
          //width: double.infinity,
          fit: BoxFit.cover,
        ),
        subtitle: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(productData['product_name']),
            const SizedBox(
              height: 5,
            ),
            Text(productData['product_details']),
            const SizedBox(
              height: 5,
            ),
            Text(productData['product_quantity']),
            const SizedBox(
              height: 5,
            ),
            Text(productData['product_price']),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          color: Colors.redAccent,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Update',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
