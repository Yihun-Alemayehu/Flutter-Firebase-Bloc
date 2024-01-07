import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            leading: Icon(Icons.sort),
            actions: [Icon(Icons.more_vert)],
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/copy.jpg'),
                fit: BoxFit.cover,
              ),
              title: Text(
                'YIHUN ALEMAYEHU',
                style: TextStyle(
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    '@Yihunalemayehu',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Flutter developer| Software Engineer| Full-stack developer ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '11.3K Followers',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '159 Followings',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: const Color.fromARGB(255, 55, 126, 250),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Message',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Photos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 5,
                //     itemBuilder: (context, index) {
                //       return Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: Container(
                //           height: 100,
                //           decoration: const BoxDecoration(
                //               image: DecorationImage(
                //                   image: AssetImage('assets/copy.jpg'))),
                //         ),
                //       );
                //     },
                //   ),
                // )
                // Card(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Container(
                //     height: 100,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage('assets/copy.jpg'))),
                //   ),
                // ),
              ],
            ),
          ),
          // SliverList.builder(
          //   itemBuilder: (context, index) {
          //     return Expanded(
          //       child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: 5,
          //         itemBuilder: (context, index) {
          //           return Card(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             child: Container(
          //               height: 100,
          //               decoration: const BoxDecoration(
          //                   image: DecorationImage(
          //                       image: AssetImage('assets/copy.jpg'))),
          //             ),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
