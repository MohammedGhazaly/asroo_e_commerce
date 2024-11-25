import 'dart:developer';

import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/core/common/animations/animations_do.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_linear_button.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_text_field.dart';
import 'package:asroo_ecommerce/core/common/widgets/show_toast.dart';
import 'package:asroo_ecommerce/core/extensions/context_extensions.dart';
import 'package:asroo_ecommerce/core/features/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_ecommerce/core/routes/app_routes.dart';
import 'package:asroo_ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:asroo_ecommerce/features/auth/presentation/widgets/shared/theme_and_lang_buttons.dart';
import 'package:asroo_ecommerce/features/auth/presentation/widgets/sign_up/user_avatar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  late AuthCubit authCubit;
  late UploadImageCubit uploadImageCubit;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    uploadImageCubit = context.read<UploadImageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ThemeAndLangButtons(),
                SizedBox(height: 50.h),
                CustomFadeInDown(
                  duration: 400,
                  child: Column(
                    children: [
                      Text(
                        "create_account".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: context.color.textColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "sign_up_welcome".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: context.color.textColor!.withOpacity(0.75),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                UserAvatarWidget(),
                SizedBox(height: 30.h),
                CustomFadeInUp(
                  duration: 400,
                  child: Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: authCubit.signupNameController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "full_name".tr(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "empty_field".tr();
                            }
                            if (value.length < 2) {
                              return "two_chars_valid".tr();
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextField(
                          controller: authCubit.signupEmailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "your_email".tr(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "empty_field".tr();
                            }
                            if (!EmailValidator.validate(value)) {
                              return "valid_email".tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextField(
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.visibility_off_rounded,
                              color: context.color.textColor,
                            ),
                          ),
                          controller: authCubit.signupPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "password".tr(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "empty_field".tr();
                            }
                            if (value.length < 8) {
                              return "valid_passwrod".tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (authContext, authState) {
                            if (authState is LoginSuccess) {
                              if (authState.role == "admin") {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.admingHomeScreenRoute);
                              } else {
                                print(authState.role);
                                Navigator.of(context).pushNamed(
                                    AppRoutes.customerHomeScreenRoute);
                              }
                            }
                          },
                          builder: (authContext, authState) {
                            return BlocConsumer<UploadImageCubit,
                                UploadImageState>(
                              listener: (imageContext, imageState) {},
                              builder: (imageContext, imageState) {
                                return CustomFadeInUp(
                                  duration: 600,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    width: (imageState is UploadImageLoading ||
                                            authState is SignUpLoading ||
                                            authState is LoginLoading)
                                        ? 0.25.sw
                                        : 1.sw,
                                    height: 55.h,
                                    child: CustomLinearButton(
                                      onPressed: () async {
                                        if (imageState is! UploadImageLoading ||
                                            authState is! SignUpLoading ||
                                            authState is LoginLoading) {
                                          if (authCubit.authImage != null) {
                                            if (formKey.currentState!
                                                .validate()) {
                                              await uploadImageCubit
                                                  .uploadImage(
                                                      file:
                                                          authCubit.authImage!)
                                                  .then(
                                                (fileLocation) {
                                                  authCubit.signUp(
                                                      avatar: fileLocation!);
                                                },
                                              );
                                            }
                                          } else {
                                            ShowToast.showToastErrorTop(
                                                context: context,
                                                message: "empty_image".tr());
                                          }
                                        }
                                      },
                                      child: Center(
                                        child: (imageState
                                                    is UploadImageLoading ||
                                                authState is SignUpLoading ||
                                                authState is LoginLoading)
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text(
                                                "sign_up".tr(),
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                  // color: context.color.textColor
                                                  color: Colors.white,
                                                  // color: context.color.primaryColor,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFadeInUp(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "you_have_account".tr(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: context.color.bluePinkLight,
                      ),
                    ),
                  ),
                  duration: 600,
                ),
                SizedBox(
                  height: 25.h,
                )

                // Text(
                //   "Login",
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
