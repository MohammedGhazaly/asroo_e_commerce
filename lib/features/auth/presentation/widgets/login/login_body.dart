import 'dart:developer';

import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/core/common/animations/animations_do.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_linear_button.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_text_field.dart';
import 'package:asroo_ecommerce/core/common/widgets/show_toast.dart';
import 'package:asroo_ecommerce/core/extensions/context_extensions.dart';
import 'package:asroo_ecommerce/core/routes/app_routes.dart';
import 'package:asroo_ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:asroo_ecommerce/features/auth/presentation/widgets/shared/theme_and_lang_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late AuthCubit authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: authCubit.formKey,
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
                        "login".tr(),
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
                        "welcome".tr(),
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
                SizedBox(height: 30.h),
                CustomFadeInUp(
                  duration: 400,
                  child: Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: authCubit.emailController,
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
                          controller: authCubit.passwordController,
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
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              if (state.role == "admin") {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.admingHomeScreenRoute);
                              } else {
                                log("HERE");
                                Navigator.of(context).pushNamed(
                                    AppRoutes.customerHomeScreenRoute);
                              }
                            }
                            if (state is LoginFailure) {
                              ShowToast.showToastErrorTop(
                                  context: context,
                                  message: authCubit.errorMessage!);
                            }
                          },
                          builder: (context, state) {
                            return CustomFadeInUp(
                              duration: 600,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                width: (state is LoginLoading) ? 0.25.sw : 1.sw,
                                height: 55.h,
                                child: CustomLinearButton(
                                  onPressed: () {
                                    if (state is! LoginLoading) {
                                      if (authCubit.formKey.currentState!
                                          .validate()) {
                                        authCubit.login();
                                      }
                                    }
                                  },
                                  child: Center(
                                    child: (state is LoginLoading)
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "login".tr(),
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
                        Navigator.pushNamed(context, AppRoutes.signUpRoute);
                      },
                      child: Text(
                        "create_account".tr(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: context.color.bluePinkLight,
                        ),
                      ),
                    ),
                    duration: 600)

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