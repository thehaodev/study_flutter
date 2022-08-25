import 'package:ecommerce_app/widgets/custom_container.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:ecommerce_app/widgets/round_button.dart';
import 'package:ecommerce_app/widgets/round_image.dart';
import 'package:flutter/material.dart';

class SaleOffPanel extends StatelessWidget {
  const SaleOffPanel({
    Key? key,
    required this.saleOffImage,
    required this.onPressed,
  }) : super(key: key);

  final String saleOffImage;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 160,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0, bottom: 5),
                  child: buildSaleOff(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  CustomContainer buildSaleOff(int index) {
    return CustomContainer(
      width: 350,
      borderShadow: true,
      color: index.isEven ? Colors.deepOrange : Colors.blueAccent,
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CustomText(
                    text: '30% OFF DURING COVID 19',
                    textColor: Colors.white,
                    size: 28,
                  ),
                  RoundButton(
                    width: 100,
                    onPressed: onPressed,
                    text: 'Get Now',
                    buttonColor: index.isEven ? Colors.white : Colors.indigo,
                    textColor: index.isEven ? Colors.deepOrange : Colors.white,
                    borderRadius: 35,
                  ),
                ],
              ),
            ),
          ),
          RoundImage(
            imageAsset: saleOffImage,
            width: 100,
            aspectRatio: 2 / 3,
          ),
        ],
      ),
    );
  }
}
