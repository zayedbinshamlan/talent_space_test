import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/features/settings/presentation/cubit/theme_cubit.dart';

class ThemeSwitchRow extends StatelessWidget {
  const ThemeSwitchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('الوضع الليلي',
            style: TextStyle(fontSize: 18, color: Colors.black)),
        CupertinoSwitch(
          value: context.watch<ThemeCubit>().state,
          onChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
      ],
    );
  }
}
