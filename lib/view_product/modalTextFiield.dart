// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// class ModalTextFiield extends StatelessWidget {
//   ModalTextFiield(
//       {super.key,
//       required this.buttonType,
//       this.name = '',
//       this.details = '',
//       this.quantity = '',
//       this.price = '',
//       this.AddId});
//   late TextEditingController nameController = TextEditingController(text: name);
//   late TextEditingController DetailsController =
//       TextEditingController(text: details);
//   late TextEditingController productQuantityController =
//       TextEditingController(text: quantity);
//   late TextEditingController PriceController =
//       TextEditingController(text: price);

//   bool buttonType;
//   String? name;
//   String? details;
//   String? quantity;
//   String? price;
//   String? AddId;

//   final AddRef = FirebaseFirestore.instance.collection('product_collection');
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: MediaQuery.of(context).viewInsets,
//       child: Container(
//         height: 500,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18),
//           child: Column(
//             children: [
//               // const Text(
//               //   'ADD',
//               //   style: TextStyle(
//               //     fontSize: 20,
//               //     fontStyle: FontStyle.italic,
//               //   ),
//               // ),

//               const SizedBox(
//                 height: 30,
//               ),
//               TextButton(
//                   onPressed: getImage, child: const Text('Upload Photo')),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 controller: nameController,
//                 // ignore: lines_longer_than_80_chars
//                 decoration: InputDecoration(
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
//                   filled: true,
//                   // fillColor: Colors.grey,
//                   hintText: 'Product Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 controller: DetailsController,
//                 // ignore: lines_longer_than_80_chars
//                 decoration: InputDecoration(
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
//                   filled: true,
//                   // fillColor: Colors.grey,
//                   hintText: 'product details',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 controller: productQuantityController,
//                 // ignore: lines_longer_than_80_chars
//                 decoration: InputDecoration(
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
//                   filled: true,
//                   // fillColor: Colors.grey,
//                   hintText: 'product quantity',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 controller: PriceController,
//                 decoration: InputDecoration(
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 18, horizontal: 10),

//                   filled: true,
//                   // fillColor: Colors.grey,
//                   hintText: 'Price',
//                   // ignore: lines_longer_than_80_chars
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               SizedBox(
//                 width: 150,
//                 child: MaterialButton(
//                   minWidth: double.infinity,
//                   height: 50,
//                   onPressed: () {
//                     if (buttonType) {
//                       createAdd(
//                           name: nameController.text,
//                           details: DetailsController.text,
//                           quantity: productQuantityController.text,
//                           price: PriceController.text);
//                       Navigator.pop(context);
//                     } else {
//                       updateAdd(
//                           name: nameController.text,
//                           details: DetailsController.text,
//                           quantity: productQuantityController.text,
//                           price: PriceController.text);
//                       Navigator.pop(context);
//                     }
//                   },
//                   color: const Color.fromARGB(255, 32, 152, 237),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   child: Text(
//                     (buttonType) ? 'Add' : 'Edit',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.white),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
