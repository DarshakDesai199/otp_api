import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeOtp.dart';
import 'api_service.dart';
import 'otp_model.dart';
import 'otp_veryfie_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String? userid;

  Future getUserSharesId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("userId");
  }

  Future getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final user = await getUserSharesId();
    setState(() {
      userid = user;
    });
  }

  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _otp1 = TextEditingController();
  final TextEditingController _otp2 = TextEditingController();
  final TextEditingController _otp3 = TextEditingController();
  final TextEditingController _otp4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Mobile Number Verification"),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      height: 35,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 5)
                        ],
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: _mobile,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        OtpModel model = OtpModel();
                        model.deviceType = "MOB";
                        model.clientKey = "1595922666X5f1fd8bb5f662";
                        model.mobile = _mobile.text;
                        model.user_id = "182";

                        OtpServices.getOtp(model.toJson()).then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("otp sent"),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.yellow,
                      child: Center(
                        child: Text("GET OTP"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey2,
                    child: Container(
                      height: 35,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 5)
                        ],
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: _otp1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                OtpVeryfie mod = OtpVeryfie();
                mod.mobile = _mobile.text;
                mod.clientKey = "1595922666X5f1fd8bb5f662";
                mod.deviceType = "MOB";
                mod.otp = _otp1.text;
                mod.userId = "184";

                OtpServices.registerOtpPost(mod.toJson()).then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeOtp(),
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 35,
              width: double.infinity,
              color: Colors.yellow,
              child: Center(child: Text("VERIFY OTP")),
            ),
          ),
        ],
      ),
    );
  }
}
