import 'package:asroo_ecommerce/core/common/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:asroo_ecommerce/core/common/screens/no_internet_screen.dart';
import 'package:asroo_ecommerce/screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is Connected) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                child: Text("Go to screen two"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ScreenTwo();
                  }));
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
