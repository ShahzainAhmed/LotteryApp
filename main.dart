// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

Random random = Random();
int x = 0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Lottery Winning",
              style: TextStyle(fontSize: 23),
            ),
          ),
        ),
        body: Column(
          // mainAxis and crossAxis are column properties
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(x.toString(), style: const TextStyle(fontSize: 80)),
            const Center(
              child: Text(
                "Lottery Winning Number is: 7",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            // Text(
            //   x > 5 ? 'x is greater than 5' : x.toString(),
            //   style: const TextStyle(fontSize: 25, color: Colors.green),
            // ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: x == 5 ? 600 : 200,
              width: 400,
              decoration: BoxDecoration(
                color: x == 5 ? Colors.green[100] : Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: x == 5
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.done_all,
                          color: Colors.green,
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Congratulations! \n You have won the Lottery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.orange[800],
                          size: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Better luck next time, Try again!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Your number was $x",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),

        // ignore: sized_box_for_whitespace
        floatingActionButton: Container(
          width: 60,
          height: 70,
          child: FittedBox(
            // using FittedBox with a container to set the size of a FAB
            child: FloatingActionButton(
                onPressed: () {
                  x = random.nextInt(6);
                  print(x);
                  setState(() {});
                },
                child:
                    // Icon(x > 5 ? Icons.generating_tokens_sharp : Icons.refresh), - (Condition for two icons together)
                    const Icon(Icons.refresh)),
          ),
        ),
      ),
    );
  }
}
