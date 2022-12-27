import 'package:flutter/material.dart';
import 'package:seller/view_product/detalis.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.product});

  var product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.product);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Detalis(
                      productData: widget.product,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
