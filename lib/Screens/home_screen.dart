import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_bloc/Screens/post_screen.dart';
import 'package:flutter_firebase_bloc/blocs/create_post/create_post_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/get_post/get_post_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/my_user/my_user_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/update_user_info/update_user_info_bloc.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:post_repository/post_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'G r a c e L i n k',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Icon(
            Icons.sort,
            color: Colors.black,
            size: 35,
          ),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       context.read<SignInBloc>().add(const SignOutRequired());
          //     },
          //     icon: const Icon(Icons.logout))
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.sensors,
              color: Colors.black,
              size: 40,
            ),
          ),
          BlocBuilder<MyUserBloc, MyUserState>(
            builder: (context, state) {
              if (state.status == MyUserStatus.success) {
                return Row(
                  children: [
                    state.user!.picture == ""
                        ? GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                                maxHeight: 500,
                                maxWidth: 500,
                                imageQuality: 40,
                              );
                              if (image != null) {
                                CroppedFile? croppedFile =
                                    await ImageCropper().cropImage(
                                  sourcePath: image.path,
                                  aspectRatio: const CropAspectRatio(
                                    ratioX: 1,
                                    ratioY: 1,
                                  ),
                                  aspectRatioPresets: [
                                    CropAspectRatioPreset.square
                                  ],
                                  uiSettings: [
                                    AndroidUiSettings(
                                      toolbarTitle: 'Cropper',
                                      toolbarColor: Colors.black,
                                      toolbarWidgetColor: Colors.white,
                                      initAspectRatio:
                                          CropAspectRatioPreset.original,
                                      lockAspectRatio: false,
                                    ),
                                    IOSUiSettings(
                                      title: 'Cropper',
                                    ),
                                  ],
                                );
                                if (croppedFile != null) {
                                  setState(() {
                                    context
                                        .read<UpdateUserInfoBloc>()
                                        .add(UploadPicture(
                                          croppedFile.path,
                                          context
                                              .read<MyUserBloc>()
                                              .state
                                              .user!
                                              .id,
                                        ));
                                  });
                                }
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Icon(
                                  Icons.person_4_rounded,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                state.user!.picture!,
                              ),
                            ),
                          )
                  ],
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      body: BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
        listener: (context, state) {
          if (state is UploadPictureSuccess) {
            setState(() {
              context.read<MyUserBloc>().state.user!.picture = state.userImage;
            });
          }
        },
        child: BlocBuilder<GetPostBloc, GetPostState>(
          builder: (context, state) {
            if (state is GetPostSuccess) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[200],
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/dad.jpg'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.posts[index].myUser.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd')
                                        .format(state.posts[index].timeStamp),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.more_vert_rounded,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              //color: Colors.grey,
                              child: Text(
                                state.posts[index].post,
                                //textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/post.png')),
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.blue[100],
                              ),
                              //child: Image.asset('assets/post.png'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetPostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('An error occurred while loading...'),
              );
            }
          },
        ),
      ),
      
      floatingActionButton: BlocBuilder<MyUserBloc, MyUserState>(
        builder: (context, state) {
          if (state.status == MyUserStatus.success) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<CreatePostBloc>(
                      create: (context) => CreatePostBloc(
                        myPostRepository: FirebasePostRepository(),
                      ),
                      child: PostScreen(
                        state.user!,
                      ),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            );
          } else {
            return const FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.clear),
            );
          }
        },
      ),
    );
  }
 

}

