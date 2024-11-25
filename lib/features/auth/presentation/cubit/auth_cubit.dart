import 'dart:io';

import 'package:asroo_ecommerce/core/services/image_picker_helper.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_request_body.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_request_body/signup_request_body.dart';
import 'package:asroo_ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Email Signup
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  String? errorMessage;
  final formKey = GlobalKey<FormState>();
  final ImagePickerHelper imagePickerHelper = ImagePickerHelper();

  Future<void> login() async {
    emit(LoginLoading());
    final result = await authRepo.login(
        loginBody: LoginRequestBody(
            email: emailController.text, password: passwordController.text));
    await result.when(success: (model) async {
      await SharedPrefService.instance
          .setString(PrefKeys.accessToken, model.data!.login!.accessToken!);
      await getUserProfile(accessToken: model.data!.login!.accessToken!);
      // emit(LoginSuccess(role: "sss"));
    }, failure: (error) {
      errorMessage = error;
      emit(LoginFailure());
    });
  }

  Future<void> signUp({required String avatar}) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(
      signUpBody: SignupReqeustBody(
          email: signupEmailController.text,
          password: signupPasswordController.text,
          avatar: avatar,
          name: signupNameController.text),
    );
    await result.when(success: (model) async {
      emailController.text = signupEmailController.text;
      passwordController.text = signupPasswordController.text;
      login();
      // emit(LoginSuccess(role: "sss"));
    }, failure: (error) {
      emit(SignUpFailure());
    });
  }

  Future<void> getUserProfile({required String accessToken}) async {
    final profileData = await authRepo.getProfileD(accessToken);
    await profileData.when(
      success: (model) async {
        await SharedPrefService.instance.setInt(PrefKeys.userId, model.id!);
        await SharedPrefService.instance.setString(PrefKeys.role, model.role!);
        emit(LoginSuccess(role: model.role!));
      },
      failure: (error) {},
    );
  }

  File? authImage;

  Future<void> pickImage({required ImageSource imageSource}) async {
    final tempImage =
        await imagePickerHelper.checkAndPickImage(imageSource: imageSource);
    if (tempImage != null) {
      authImage = tempImage;
      emit(SignupImagePicked());
    }
  }
}
