import 'package:asroo_ecommerce/features/admin/users/data/model/useres/useres_model/user.dart';
import 'package:asroo_ecommerce/features/admin/users/data/repo/useres_repo.dart';
import 'package:asroo_ecommerce/features/admin/users/presentation/cubit/users_state.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UseresCubit extends Cubit<UseresState> {
  UseresCubit(this.useresRepo) : super(UseresStateInitial());

  final UseresRepo useresRepo;
  List<User> useres = [];
  Future<void> getUseres() async {
    emit(GetUseresLoadingState());
    final either = await useresRepo.getUsers();

    either.when(
      success: (model) {
        emit(GetUseresSuccessState());
        useres = model.data?.users ?? [];
      },
      failure: (error) {
        emit(GetUseresFailureState());
      },
    );
  }
}
