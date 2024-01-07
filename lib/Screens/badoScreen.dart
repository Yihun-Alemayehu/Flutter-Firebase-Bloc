import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/my_user/my_user_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/update_user_info/update_user_info_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class BadoScreen extends StatefulWidget {
  const BadoScreen({super.key});

  @override
  State<BadoScreen> createState() => _BadoScreenState();
}

class _BadoScreenState extends State<BadoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'What\'s in your mind ?',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
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
                          aspectRatioPresets: [CropAspectRatioPreset.square],
                          uiSettings: [
                            AndroidUiSettings(
                              toolbarTitle: 'Cropper',
                              toolbarColor: Colors.black,
                              toolbarWidgetColor: Colors.white,
                              initAspectRatio: CropAspectRatioPreset.original,
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
                                  context.read<MyUserBloc>().state.user!.id,
                                ));
                          });
                        }
                      }
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.photo),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Add pic'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(Icons.emoji_emotions),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Feeling'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(Icons.person_add_alt),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Tag Person'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromARGB(255, 55, 126, 250),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/community');
                    },
                    child: const Text(
                      'Post ',
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
        ),
      ),
    );
  }
}
