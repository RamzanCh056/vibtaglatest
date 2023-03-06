// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_json_view/flutter_json_view.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
//
// class MyStripePage extends StatefulWidget {
//   @override
//   State<MyStripePage> createState() => _MyStripePageState();
// }
// var data;
//
// class _MyStripePageState extends State<MyStripePage> {
//   // const MyHomePage({Key? key}) : super(key: key);
//   var paymentData;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 await makePayment();
//               },
//               child: Text('Pay with Stripe'),
//             ),
//             ElevatedButton(
//               onPressed: ()  {
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data.toString())));
//               },
//               child: Text('Check Value'),
//             ),
//             // Text(data.toString()),
//             Expanded(child: Container(
//                 child: JsonView.map(data))),
//           ],
//         ),
//       ),
//     );
//   }
//
//   makePayment() async{
//     try{
//       paymentData=await createPayment('5','USD');
//       await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               paymentIntentClientSecret: paymentData['client_secret'],
//               googlePay: true,
//               applePay: true,
//               style: ThemeMode.dark,
//               merchantCountryCode: 'US',
//               merchantDisplayName: 'ramzan'
//           ));
//       displayPaymentSheet();
//
//     }catch(e){
//       print('Make Payment Exception = ${e.toString()}');
//     }
//   }
//
//   displayPaymentSheet() async{
//     try{
//       await Stripe.instance.presentPaymentSheet(
//           parameters: PresentPaymentSheetParameters(clientSecret: paymentData['client_secret'],
//               confirmPayment: true)
//       );
//       setState(() {
//         paymentData="";
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Paid Successfully')));
//
//     } on StripeException catch(e){
//       print('Stripe Exception = $e');
//       showDialog(context: context, builder: (_)=>AlertDialog(
//         content: Text('Cancelled'),
//       ));
//     }
//
//   }
//
//   createPayment(String amount, String currency) async {
//     try{
//       var body={
//         'amount': calculateAmount(amount),
//         'currency':currency,
//         'payment_method_types[]': 'card'
//       };
//       var response=await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization' :'Bearer sk_test_51L97r12345jA0fCP7bsOmGFo4H2jZlN5OBEPRxTZGRgcg4P1qUthOe3Uj1avbfEkJJU8O4xHyJaXPMxJxBwIx7obiYtqn00jc9Jhlyh',
//             'Content-Type' : 'application/x-www-form-urlencoded'
//           }
//       );
//       data=jsonDecode(response.body.toString());
//       return data;
//
//     }catch(e){
//       print('Exception = ${e.toString()}}');
//     }
//
//
//
//
//   }
//
//   calculateAmount(String amount) {
//     var price=int.parse(amount)*100;
//     return price.toString();
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map<String, dynamic>? paymentIntent;
  var SECRET_KEY = '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';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Make Payment'),
          onPressed: ()async{
            await makePayment();
          },
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('3', 'USD');
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'ramzan')).then((value){
      });


      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
      ).then((value){
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green,),
                      Text("Payment Successfully"),
                    ],
                  ),
                ],
              ),
            ));

        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }


}
