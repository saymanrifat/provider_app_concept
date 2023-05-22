import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_concept/provider/home_page_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, providerValues, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      providerValues.eligablityMessage.toString(),
                      style: TextStyle(
                          color: (providerValues.isEligable == true)
                              ? Colors.green
                              : Colors.red),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Enter your Age"),
                      onChanged: (value) {
                        providerValues.checkEligibity(int.parse(value));
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
