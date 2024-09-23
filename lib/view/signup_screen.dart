import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/components/round_button.dart';
import 'package:getx_with_mvc/resources/routes/routes_name.dart';
import 'package:getx_with_mvc/utils/utlls.dart';
import 'package:getx_with_mvc/view_models/controllers/signup_view_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final signupViewController = Get.put(SignupViewController());

  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // Dispose of controllers and focus nodes
    signupViewController.emailController.value.dispose();
    signupViewController.passwordController.value.dispose();
    signupViewController.emailFocusNode.value.dispose();
    signupViewController.passwordFocusNode.value.dispose();

    _obscurePassword.dispose();  // Dispose of ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Signup Screen'),
        ),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        focusNode: signupViewController.emailFocusNode.value,
                        controller: signupViewController.emailController.value,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s")), // Prevent spaces
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter your email';
                          }
                        },
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, signupViewController.emailFocusNode.value, signupViewController.passwordFocusNode.value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: signupViewController.passwordController.value,
                              focusNode: signupViewController.passwordFocusNode.value,
                              obscureText: _obscurePassword.value,
                              obscuringCharacter: '*',
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter your password';
                                }
                                else if (signupViewController.passwordController.value.text.length < 6) {
                                  return 'Password should be greater than 6 characters';
                                }},
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      _obscurePassword.value = !_obscurePassword.value;
                                    },
                                    child: Icon(_obscurePassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off_outlined)),
                              ),
                            );
                          }),
                    ],
                  ),
                ),

                SizedBox(
                  height: height * .1,
                ),
                Obx(()=> RoundButton(
                  title: 'Signup',
                  loading: signupViewController.loading.value,
                  onPress: () {
                    if (_formKey.currentState!.validate()){
                      Map<String, dynamic> data = {
                        'email': signupViewController.emailController.value.text,
                        'password': signupViewController.passwordController.value.text,
                      };
                      signupViewController.signupApi(data, context);
                    }
                  },
                )),

                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteName.LoginScreen);
                  },
                  child: const Text('Already have an account? Login'),
                )
              ],
            )));
  }
}
