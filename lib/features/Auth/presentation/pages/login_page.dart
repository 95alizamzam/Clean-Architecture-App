import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/constants/user_constants.dart';
import 'package:twekl_test_app/core/colors.dart';
import 'package:twekl_test_app/core/navigation_services.dart';
import 'package:twekl_test_app/core/shared_prefrences.dart';
import 'package:twekl_test_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:twekl_test_app/features/Home/presentation/pages/home_screen.dart';
import 'package:twekl_test_app/shared/components/btns.dart';
import 'package:twekl_test_app/shared/components/loader.dart';
import 'package:twekl_test_app/shared/components/sized_box.dart';
import 'package:twekl_test_app/shared/components/text_field.dart';

import '../../../../core/sl.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController nameCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ecommerce App',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Vspace(height: 10),
                  Text(
                    'Login To Your Free Account',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Vspace(height: 30),
                  UserNameField(
                    nameController: nameCon,
                  ),
                  const Vspace(height: 20),
                  PasswordField(
                    passController: passCon,
                  ),
                  const Vspace(height: 20),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is LoginDoneState) {
                        sl<SharedPrefrencesClass>()
                            .saveString(key: token, value: state.token)
                            .then((value) {
                          sl<NavigationServices>().goto(
                            context: context,
                            nextScreen: const HomePage(),
                            replace: true,
                          );
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginFailedState) {
                        return Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Error >>>  ${state.error}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const Vspace(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Loader();
                      }
                      return Align(
                        alignment: Alignment.center,
                        child: CustomElevatedBtn(
                          onTap: () => onTap(context),
                          label: 'Login',
                          bgColor: primaryColor.withOpacity(.3),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    if (!formKey.currentState!.validate()) return;

    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(nameCon.text.trim(), passCon.text.trim()),
    );
  }
}
