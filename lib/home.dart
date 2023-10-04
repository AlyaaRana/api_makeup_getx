import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/product_controller.dart';

class HomePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Makeup"),
      ),
      body: Obx(() => productController.isLoading.value
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: productController.productresponsemodel.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productController.productresponsemodel[index];
                return Container(
                  margin: EdgeInsets.all(15),
                  child: ListTile(
                    leading: Image.network(product.imageLink),
                    title: Text(product.name),
                  ),
                );
              },
            )),
    );
  }
}
