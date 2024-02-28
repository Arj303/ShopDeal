
import 'package:buyrent/screens/feed_pages/postpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post_providers.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
                children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25),),
                              border: Border.all(color: Colors.black),
                              color: Colors.white,

                            
                          ),
                          width: MediaQuery.sizeOf(context).width*0.85,
                            height: 400,

                            child: PostPage(),
                        ),
                      ),
                    ),

                ],
              ),
            ),

        ),


      );

  }
}
