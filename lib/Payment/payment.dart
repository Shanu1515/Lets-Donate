import 'package:donate/Payment/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Page'),
        ),
        body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              RaisedButton(
                  onPressed: openCheckout, child: Text('Proceed to Payment'))
            ])),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_wAXhdAl48q055k',
      'amount': 10000,
      'name': 'Lets-Donate',
      //'description': 'Fine T-Shirt',
      'prefill': {'contact': '9971715927', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _showDialog(int task, {String id}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return task == 1
            ? DialogResponses(
                color: Colors.green[300],
                icon: Icons.check_circle,
                message: "Transaction\nSuccessfull",
                id: id,
              )
            : task == 2
                ? DialogResponses(
                    color: Colors.red,
                    icon: Icons.cancel,
                    message: "Transaction\nFailed",
                  )
                : DialogResponses(
                    color: Colors.amber,
                    icon: Icons.account_balance_wallet,
                    message: "Selected\nExternal Wallet",
                  );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _showDialog(1, id: response.paymentId);
    //Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName);
  }
}
