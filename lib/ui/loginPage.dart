import 'package:fire_book/bloc/bloc_auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //validate key
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          title: const Text('Login Page'),
          centerTitle: true,
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (input) => input!.isEmpty || input.length < 5
                            ? "Incorrect input"
                            : null,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      TextFormField(
                        validator: (input) => input!.isEmpty || input.length < 5
                            ? "Incorrect input"
                            : null,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => registerButton(formKey, context,
                            emailController.text, passwordController.text),
                        child: const Text('Register')),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => loginButton(formKey, context,
                            emailController.text, passwordController.text),
                        child: const Text('Login'))
                  ],
                )
              ]);
            } else if (state is AuthDone) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (input) =>
                                input!.isEmpty || input.length < 5
                                    ? "Incorrect input"
                                    : null,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          TextFormField(
                            validator: (input) =>
                                input!.isEmpty || input.length < 5
                                    ? "Incorrect input"
                                    : null,
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () => registerButtonDone(state, context),
                            child: const Text('Register')),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () => loginButtonDone(state, context),
                            child: const Text('Login'))
                      ],
                    )
                  ]);
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (input) =>
                              input!.isEmpty || input.length < 5
                                  ? "Incorrect input"
                                  : null,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextFormField(
                          validator: (input) =>
                              input!.isEmpty || input.length < 5
                                  ? "Incorrect input"
                                  : null,
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => registerButton(formKey, context,
                              emailController.text, passwordController.text),
                          child: const Text('Register')),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () => loginButton(formKey, context,
                              emailController.text, passwordController.text),
                          child: const Text('Login'))
                    ],
                  )
                ]);
          },
        ),
      ),
    );
  }
}

//if initialState

void registerButton(GlobalKey<FormState> formKey, BuildContext context,
    String email, String password) {
  if (formKey.currentState!.validate()) {
    context
        .watch<AuthBloc>()
        .add(ClickRegisterButton(email: email, password: password));
  }
}

void loginButton(GlobalKey<FormState> formKey, BuildContext context,
    String email, String password) {
  if (formKey.currentState!.validate()) {
    context
        .watch<AuthBloc>()
        .add(ClickLoginButton(email: email, password: password));
  }
}

//if doneState

void registerButtonDone(AuthDone state, BuildContext context) {
  if (state.authOk) {
    Navigator.pushNamed(context, '/homePage');
  }
}

void loginButtonDone(AuthDone state, BuildContext context) {
  if (state.authOk) {
    Navigator.pushNamed(context, '/homePage');
  }
}
