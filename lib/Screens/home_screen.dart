import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_bloc/Screens/post_screen.dart';
import 'package:flutter_firebase_bloc/blocs/my_user/my_user_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/sign_in/sign_in_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/update_user_info/update_user_info_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[50],
        leading: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Icon(
            Icons.menu_sharp,
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
                                radius: 35,
                                child: Icon(Icons.person),
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
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[100],
                ),
                width: double.infinity,
                height: 350,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Padding(
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
                              'GraceLink',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('3 minutes'),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
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
                        child: const Text(
                          'May the God of hope fill you with all joy and peace as you trust in him, so that you may overflow with hope by the power of the Holy Spirit.',
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
