import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/components/round_button.dart';
import 'package:getx_with_mvc/resources/routes/routes_name.dart';
import 'package:getx_with_mvc/utils/utlls.dart';
import 'package:getx_with_mvc/view_models/controllers/login_view_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginViewController = Get.put(LoginViewController());

  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> _obsecureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // Dispose of controllers and focus nodes
    loginViewController.emailController.value.dispose();
    loginViewController.passwordController.value.dispose();
    loginViewController.emailFocusNode.value.dispose();
    loginViewController.passwordFocusNode.value.dispose();

    _obsecureText.dispose();  // Dispose of ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login Screen'),
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
                        focusNode: loginViewController.emailFocusNode.value,
                        controller: loginViewController.emailController.value,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s")), // Prevent spaces
                        ],
                        decoration: const InputDecoration(
                          hintText: 'email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please entre your email';
                          }
                        },
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, loginViewController.emailFocusNode.value, loginViewController.passwordFocusNode.value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ValueListenableBuilder(
                          valueListenable: _obsecureText,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: loginViewController.passwordController.value,
                              focusNode: loginViewController.passwordFocusNode.value,
                              obscureText: _obsecureText.value,
                              obscuringCharacter: '*',
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please entre your password';
                                }
                                else if (loginViewController.passwordController.value.text.length < 6) {
                                  return 'Password should be greater than 6 characters';
                              }},
                              decoration: InputDecoration(
                                hintText: 'password',
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      _obsecureText.value = !_obsecureText.value;
                                    },
                                    child: Icon(_obsecureText.value
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
                  title: 'Login',
                  loading: loginViewController.loading.value,
                  onPress: () {
                    if (_formKey.currentState!.validate()){
                      loginViewController.loginApi();
                    }
                  },
                )),

                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {
                   Get.toNamed(RouteName.SignupScreen);
                  },
                  child: const Text('Don\'t have an account? Signup'),
                )
              ],
            )));
  }
}
