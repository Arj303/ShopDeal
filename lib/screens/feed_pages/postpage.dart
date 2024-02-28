// import 'package:cached_network_image/cached_network_image.dart';
import 'package:buyrent/screens/chat_pages/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post_providers.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override

  

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController1>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,

            children: [
             controller.imgUrl == ""
                  ? SizedBox(
                width: 8.0,
              )
                  : Image.network(controller.imgUrl!,height: 180,
             width: 200,),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Item: ${controller.name}"),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Date of Purchase: ${controller.dop}"),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Sell/Rent: ${controller.sr}"),
              ),
              SizedBox(height: 4),
              controller.dop == "Rent" ?


                    Container(
                      child: Column(
                        children:[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Amount: ${controller.amount}"),
                        ),
                        SizedBox(height: 4),
                        ],
                      ),
                    )
                  :


                Container(
                  child: Column(
                    children:[



                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("mode of rent: ${controller.dor}"),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Amount: ${controller.amount}"),
                      ),


                      SizedBox(height: 4),
                    ],
                  ),
                ),

              SizedBox(height: 10,),

              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  child: Text("I'm Interested")),











            ],
          );



  }
}
