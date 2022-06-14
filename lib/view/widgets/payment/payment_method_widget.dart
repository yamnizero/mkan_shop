import 'package:flutter/material.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {

  int radioPaymentIndex=1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          buildRadioPayment(
            name: "PayPal",
            image: "assets/images/paypal.png",
            scale: 0.7,
            value: 1,
            onChange: (int? value){
              setState(() {
                radioPaymentIndex = value!;
              });
            }
          ),
          const SizedBox(height: 15,),
          buildRadioPayment(
              name: "Google Pay",
              image: "assets/images/google.png",
              scale: 0.8,
              value: 2,
              onChange: (int? value){
                setState(() {
                  radioPaymentIndex = value!;
                });
              }
          ),
          const SizedBox(height: 15,),
          buildRadioPayment(
              name: "PayPal",
              image: "assets/images/credit.png",
              scale: 0.7,
              value: 3,
              onChange: (int? value){
                setState(() {
                  radioPaymentIndex = value!;
                });
              }
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required String name,
    required double scale,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                text: name,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
