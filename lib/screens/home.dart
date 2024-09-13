import 'package:bussiness_ite/screens/cart.dart';
import 'package:bussiness_ite/strings/asset_path.dart';
import 'package:flutter/material.dart';

import 'product_details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Clothing Store')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 50, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton(onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                      
                      ),
                    ),
                    );
                },
                child: Text("Cart"),
                )
              ],),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-200,
              child:  Image.asset(AssetPath.headPage,fit: BoxFit.fill)),
            ProductListPage(),
          ],
        ),
      )
      );
   
  }
}

class headPage extends StatefulWidget {
  const headPage({super.key});

  @override
  State<headPage> createState() => _headPageState();
}

class _headPageState extends State<headPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [

      ],),
    );
  }
}