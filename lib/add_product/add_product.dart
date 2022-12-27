import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final auth = FirebaseAuth.instance;
  late final XFile? img;

  Future<XFile?> getImage() async {
    final imagePicker = ImagePicker();

    img = await imagePicker.pickImage(source: ImageSource.gallery);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController DetailsController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TextEditingController PriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body:
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: getImage,
              child: const Text('Upload Photo'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                filled: true,
                hintText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: DetailsController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                filled: true,
                hintText: 'product details',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: productQuantityController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                filled: true,
                hintText: 'product quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: PriceController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                filled: true,
                hintText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 150,
              child: MaterialButton(
                onPressed: () {
                  createAdd(
                      name: nameController.text,
                      details: DetailsController.text,
                      quantity: productQuantityController.text,
                      price: PriceController.text,
                      image: img);
                  Navigator.pop(context);

                  // if (buttonType) {
                  //   createAdd(
                  //       name: nameController.text,
                  //       details: DetailsController.text,
                  //       quantity: productQuantityController.text,
                  //       price: PriceController.text);
                  //   Navigator.pop(context);
                  // } else {
                  //   updateAdd(
                  //       name: nameController.text,
                  //       details: DetailsController.text,
                  //       quantity: productQuantityController.text,
                  //       price: PriceController.text);
                  //   Navigator.pop(context);
                  // }
                },
                color: const Color.fromARGB(255, 32, 152, 237),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createAdd({
    required String name,
    required String details,
    required String quantity,
    required String price,
    required XFile? image,
  }) async {
    final AddRef = FirebaseFirestore.instance.collection('product_collection');

    var uuid = const Uuid();
    final userid = auth.currentUser!.uid;
    var AddId = uuid.v4();
   

    final refrence = FirebaseStorage.instance
        .ref()
        .child('product_image')
        .child(image!.name);
    final file = File(image.path);
    await refrence.putFile(file);
    final imageLink = await refrence.getDownloadURL();
     final datetime = DateTime.now();
    final time = '${datetime.hour}:${datetime.minute}pm';

    try {
      await AddRef.doc(AddId).set({
        'product_name': name,
        'product_details': details,
        'product_quantity': quantity,
        'product_price': price,
        'user_id': userid,
        'add_id': AddId,
        'date': time,
        'product_image': imageLink
      });

      // ignore: empty_catches
    } catch (e) {}
  }

  // Future<void> updateAdd({
  //   required String name,
  //   required String details,
  //   required String quantity,
  //   required String price,
  // }) async {
  //   //print('lsdkfglsdkfgsdifugsdfmgksdfghsdfgskdf');
  //   try {
  //     await AddRef.doc(AddId).update({
  //       'Product name': name,
  //       'Product details': details,
  //       'Product quantity': quantity,
  //       'Product price': price,
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> updateImage(XFile image) async {
  //   final refrence = FirebaseStorage.instance.ref().child('product_image');
  //   final file = File(image.path);
  //   await refrence.putFile(file);
  //   final imageLink = await refrence.getDownloadURL();

  //   await AddRef.doc(auth.currentUser!.uid)
  //       .update({'product_image': imageLink});
  //   // ignore: avoid_print
  //   print(imageLink);
  // }
}
