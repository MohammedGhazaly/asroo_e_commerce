import 'package:asroo_ecommerce/core/common/animations/animations_do.dart';
import 'package:asroo_ecommerce/core/common/widgets/image_camera_bottom_sheet.dart';
import 'package:asroo_ecommerce/core/extensions/context_extensions.dart';
import 'package:asroo_ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return CustomFadeInDown(
      duration: 400,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ImageCameraBottomSheet(
                cameraCallBack: () {
                  authCubit.pickImage(imageSource: ImageSource.camera);
                  Navigator.of(context).pop();
                },
                galleryCallBack: () {
                  authCubit.pickImage(imageSource: ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: Colors.black.withOpacity(0.4),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Colors.black.withOpacity(0.4),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4),
                          BlendMode.darken,
                        ),
                        image: authCubit.authImage == null
                            ? AssetImage(
                                "assets/images/customer/user.png",
                              )
                            : FileImage(
                                authCubit.authImage!,
                              ),
                      ),
                    ),
                    // child: authCubit.authImage == null
                    //     ? Image.asset(
                    //         "assets/images/customer/user.png",
                    //         // color: Colors.black.withOpacity(0.5),
                    //         fit: BoxFit.cover,
                    //       )
                    //     : ClipRRect(
                    //         borderRadius: BorderRadius.circular(100.r),
                    //         child: Image.file(
                    //           authCubit.authImage!,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        color: Colors.white,
                        size: 32.h,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
