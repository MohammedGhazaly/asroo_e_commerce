import 'package:asroo_ecommerce/core/common/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:asroo_ecommerce/core/common/screens/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is Connected) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                child: Text("Go back"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        }
        return NoInternetScreen();
      },
    );
  }
}
