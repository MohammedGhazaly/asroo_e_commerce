import 'package:asroo_ecommerce/features/customer/home/presentation/cubit/customr_home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CustomrHomeCubit extends Cubit<CustomrHomeState> {
  CustomrHomeCubit() : super(CustomrHomeStateInitial());
}
