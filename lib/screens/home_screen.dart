import 'package:currency_exchange/services/currency_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future curencyList = CurrencyService().getCurrencyList();
  @override
  void initState() {
    super.initState();
    print(curencyList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Exchange'),
      ),
      body: SafeArea(
          child: Column(
        children: [Text('data')],
      )),
    );
  }
}
