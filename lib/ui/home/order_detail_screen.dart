import 'package:flutter/material.dart';
import 'package:ticketing/core/components/space.dart';
import 'package:ticketing/core/constants/color.dart';
import 'package:ticketing/core/extensions/idr_currency.dart';
import 'package:ticketing/gen/assets/assets.gen.dart';
import 'package:ticketing/ui/home/model/product_model.dart';


class OrderDetailScreen extends StatelessWidget {
  final List<ProductModel> products;
  const OrderDetailScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Assets.images.back.image(),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final item = products[index];
          return Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke),
              borderRadius: BorderRadius.circular(46),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.productName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(item.type),
                      ],
                    ),
                  ],
                ),
                SpaceHeight(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item.price.currencyFormatRp} x ${item.quantity}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (item.price * item.quantity).currencyFormatRp,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SpaceHeight(20),
        itemCount: products.length,
      ),
    );
  }
}