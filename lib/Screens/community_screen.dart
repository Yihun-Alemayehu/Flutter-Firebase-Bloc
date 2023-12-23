import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Title text
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 40, right: 20),
              child: Row(
                children: [
                  Text(
                    'GraceLink',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.sensors,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 5, right: 5),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/dad.jpg'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Aychew Desalegn',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Text('30 minutes ago'),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.more_vert),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('This will be the first community post..'),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('assets/post.png'),
                                )),
                            // child: const Image(
                            //   image:
                            // ),
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add_comment_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.ios_share,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
