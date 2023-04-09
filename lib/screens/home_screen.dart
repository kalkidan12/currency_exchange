import 'dart:convert';

import 'package:currency_exchange/constants/config_constants.dart';
import 'package:currency_exchange/services/currency_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> currencyList = [
    "SGD",
    "MYR",
    "EUR",
    "USD",
    "AUD",
    "JPY",
    "CNH",
    "HKD",
    "CAD",
    "INR",
    "DKK",
    "GBP",
    "RUB",
    "NZD",
    "MXN",
    "IDR",
    "TWD",
    "THB",
    "VND"
  ];

  late final exchangedValue;
  // Future getExchangedValue() async {
  //   final value = CurrencyService().exchangeCurrency('SGD', 'MYR', 20);
  //   setState(() {
  //     exchangedValue = value;
  //   });

  //   print(value);
  //   print(exchangedValue);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? selectedValueFrom;
  String? selectedValueTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 117, 211, 255),
            Color.fromARGB(255, 90, 255, 214)
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 2 + 60,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: const Text(
                      'Currency Converter',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Text(
                                currencyList[0],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          items: currencyList
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValueFrom,
                          onChanged: (value) {
                            setState(() {
                              selectedValueFrom = value as String;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            height: 50,
                            width: 110,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 30,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 120,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 71, 184, 255),
                            ),
                            elevation: 2,
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 5, bottom: 5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 239),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.swap_vert_sharp,
                          size: 70,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Text(
                                currencyList[2],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          items: currencyList
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValueFrom,
                          onChanged: (value) {
                            setState(() {
                              selectedValueFrom = value as String;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            height: 50,
                            width: 110,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 30,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 120,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 71, 184, 255),
                            ),
                            elevation: 2,
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 5, bottom: 5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 239),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 2 - 60,
              color: Color.fromARGB(255, 170, 232, 255),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        '7',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '8',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '9',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        'C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        '.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 57, 149, 192),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
