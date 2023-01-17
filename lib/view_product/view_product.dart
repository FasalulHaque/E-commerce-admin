import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller/add_product/add_product.dart';
import 'package:seller/home/acccount.dart';
import 'package:seller/view_product/product_details.dart';

class viewProduct extends StatelessWidget {
  viewProduct({super.key});

  CollectionReference AddRef =
      FirebaseFirestore.instance.collection('product_collection');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            )),
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) => const Account(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>( 
        stream: AddRef.where('user_id', isEqualTo: _auth.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // ignore: avoid_print
            print(snapshot.data!.docs);
            // ignore: unused_local_variable, non_constant_identifier_names
            final Additems = snapshot.data!.docs;
            // print(Additems[0]['product_name']);
            return SingleChildScrollView(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 300,
                      childAspectRatio: 0.75),
                  itemCount: Additems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    product: Additems[index],
                                  )));
                        },
                        child: Card(
                          child: ListTile(
                            title: Image.network(
                              // 'https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?w=2000',
                              Additems[index]['product_image'].toString(),
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                    Additems[index]['product_name'].toString()),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(Additems[index]['product_details']
                                    .toString()),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(Additems[index]['product_quantity']
                                    .toString()),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(Additems[index]['product_price']
                                    .toString()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // showModalBottomSheet(
                                        //     isScrollControlled: true,
                                        //     context: context,
                                        //     builder: (context) => ModalTextFiield(
                                        //           buttonType: false,
                                        //           name: Additems[index]
                                        //                   ['Product name']
                                        //               .toString(),
                                        //           details: Additems[index]
                                        //                   ['Product details']
                                        //               .toString(),
                                        //           quantity: Additems[index]
                                        //                   ['Product quantity']
                                        //               .toString(),
                                        //           price: Additems[index]
                                        //                   ['Product price']
                                        //               .toString(),
                                        //           AddId: Additems[index]['Add id']
                                        //               .toString(),
                                        //         ));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          // deleteAdd(Additems[index]['Add id']
                                          //     .toString());
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          // ignore: inference_failure_on_function_invocation
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) {
          //     return ModalTextFiield(
          //       buttonType: true,
          //     );
          //   },
          // );
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ));
        },
        child: const Icon(Icons.navigation),
      ),
    );
  }

  // Future<void> deleteAdd(String id) async {
  //   final addRef = FirebaseFirestore.instance.collection('product_collection');
  //   try {
  //     await addRef.doc(id).delete();
  //   } catch (e) {}
  // }
}
