// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class PageOTP extends StatefulWidget {
  const PageOTP({super.key});

  @override
  State<PageOTP> createState() => _PageOTPState();
}

class _PageOTPState extends State<PageOTP> {
  final bool _isLoading = false;
  bool isValid = true;
  bool isSuccess = true;
  String _otp = "";
  String request_id = "";
  String kodeOTP = "111111";
  bool _keyboard = false;
  final _otpSymbols = ["", "", "", ""];
  int _heightKeyboard = 3;
  final interval = const Duration(seconds: 1);
  String register_id = "";
  int timerMaxSeconds = 120;
  double fontSize = 40;
  int currentSeconds = 0;
  bool stopTimer = false;
  bool isApplyOtpSent = true;
  int currentTime = 0;
  bool isFailOTP = false;
  bool isTimeOut = false;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  void _handleKeypadClick(String val) {
    setState(() {
      if (_otp.length < 4) {
        _otp = _otp + val;
        for (int i = 0; i < _otp.length; i++) {
          _otpSymbols[i] = _otp[i];
        }
        if (_otp.length == 4) {
          _handleSubmit();
        }
      }
    });
  }

  void _handleKeypadDel() {
    setState(() {
      if (_otp.isNotEmpty) {
        _otp = _otp.substring(0, _otp.length - 1);
        for (int i = _otp.length; i < 4; i++) {
          _otpSymbols[i] = "";
        }
      }
    });
  }

  TextStyle textStyleCustom({Color color = Colors.black}) {
    return TextStyle(
        fontSize: MediaQuery.of(context).size.width / 10,
        color: color,
        fontWeight: FontWeight.w400);
  }

  void _handleSubmit() {
    // Get.to(MapPage());
  }


  verifyLogin() async {}

  @override
  void initState() {
    super.initState();
    setState(() {
      !_keyboard ? _heightKeyboard = 5 : _heightKeyboard = 3;
      _keyboard = !_keyboard;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double widthkotak = width / 7;
    double heightkotak = height / 11;

    // print(width.toString() + height.toString());
    return LoadingOverlay(
        progressIndicator: const CircularProgressIndicator(),
        color: Warna.biruToscaMuda,
        opacity: 0.2,
        isLoading: _isLoading,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(context,
              title: "Account Verification", back: true, isSearchBar: false),
          body: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              height: Get.height,
              width: width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 10),
                    child: SizedBox(
                      width: 400,
                      child: Text(
                        "Please enter the OTP sent on your registered email",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Warna.biruTua,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // _showKeyboad();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          for (var j = 0; j < _otpSymbols.length; j++)
                            Container(
                              height: heightkotak,
                              width: widthkotak,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Warna.softSilver),
                                  color: Warna.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  _otpSymbols[j],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Center(
                      child: GestureDetector(
                          onTap: () {
                          },
                          child:
                              CustomText().titleText("Resend ?", fontSize: 18)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('1');
                                },
                                child: Text('1', style: textStyleCustom()),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('2');
                                },
                                child: Text('2',
                                    style: TextStyle(
                                        fontSize: fontSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('3');
                                },
                                child: Text('3',
                                    style: TextStyle(
                                        fontSize: fontSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                            )
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('4');
                                },
                                child: Text('4', style: textStyleCustom()),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('5');
                                },
                                child: Text('5', style: textStyleCustom()),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('6');
                                },
                                child: Text('6', style: textStyleCustom()),
                              ),
                            )
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('7');
                                },
                                child: Text('7',
                                    style: TextStyle(
                                        fontSize: fontSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('8');
                                },
                                child: Text('8', style: textStyleCustom()),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Warna.retro,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextButton(
                                onPressed: () {
                                  _handleKeypadClick('9');
                                },
                                child: Text('9', style: textStyleCustom()),
                              ),
                            )
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent[200],
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                  onPressed: () {
                                    _handleKeypadDel();
                                  },
                                  child: const Text(
                                    '\u{232b}',
                                    style: TextStyle(
                                        fontSize: 35, color: Warna.white),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Warna.retro,
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                  onPressed: () {
                                    _handleKeypadClick('0');
                                  },
                                  child: Text('0', style: textStyleCustom()),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Warna.biru,
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                  onPressed: () {
                                    _handleSubmit();
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_sharp,
                                    size:
                                        MediaQuery.of(context).size.width / 9,
                                    color: Warna.white,
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ]),
                  )
                ],
              )),
        ));
  }
}
