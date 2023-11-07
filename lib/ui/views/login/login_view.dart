import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:socket_chat/ui/common/validations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(
    fields: [
  FormTextField(name: 'usernameInput', validator: validateUsername),
])
class LoginView extends StackedView<LoginViewModel>  with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SOCKET CHAT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 50),
            _buildUsernameField(viewModel),
            const SizedBox(height: 20),
            _buildLoginButton(context,viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField(LoginViewModel viewModel) {
    return TextFormField(
      controller: usernameInputController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Username',
      ),
      onChanged: (value) => viewModel.username = value,
    );
  }

  Widget _buildLoginButton(BuildContext context,LoginViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        if(validateFormFields(viewModel)){
          viewModel.login(context);
        }else{
          showErrorToast().show(context);
        }
      },
      child: const Text('Login'),
    );
  }

  CherryToast showErrorToast() => CherryToast.error(title: Text(getValidationMessage("usernameInput")?? "Validation Error",textAlign: TextAlign.center,),width: double.maxFinite,);

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }


  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
