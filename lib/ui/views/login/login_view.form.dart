// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:socket_chat/ui/common/validations.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String UsernameInputValueKey = 'usernameInput';

final Map<String, TextEditingController> _LoginViewTextEditingControllers = {};

final Map<String, FocusNode> _LoginViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LoginViewTextValidations = {
  UsernameInputValueKey: validateUsername,
};

mixin $LoginView {
  TextEditingController get usernameInputController =>
      _getFormTextEditingController(UsernameInputValueKey);

  FocusNode get usernameInputFocusNode =>
      _getFormFocusNode(UsernameInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_LoginViewTextEditingControllers.containsKey(key)) {
      return _LoginViewTextEditingControllers[key]!;
    }

    _LoginViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LoginViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LoginViewFocusNodes.containsKey(key)) {
      return _LoginViewFocusNodes[key]!;
    }
    _LoginViewFocusNodes[key] = FocusNode();
    return _LoginViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    usernameInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    usernameInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UsernameInputValueKey: usernameInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _LoginViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LoginViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LoginViewTextEditingControllers.clear();
    _LoginViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get usernameInputValue =>
      this.formValueMap[UsernameInputValueKey] as String?;

  set usernameInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({UsernameInputValueKey: value}),
    );

    if (_LoginViewTextEditingControllers.containsKey(UsernameInputValueKey)) {
      _LoginViewTextEditingControllers[UsernameInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasUsernameInput =>
      this.formValueMap.containsKey(UsernameInputValueKey) &&
      (usernameInputValue?.isNotEmpty ?? false);

  bool get hasUsernameInputValidationMessage =>
      this.fieldsValidationMessages[UsernameInputValueKey]?.isNotEmpty ?? false;

  String? get usernameInputValidationMessage =>
      this.fieldsValidationMessages[UsernameInputValueKey];
}

extension Methods on FormStateHelper {
  setUsernameInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UsernameInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    usernameInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      UsernameInputValueKey: getValidationMessage(UsernameInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _LoginViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LoginViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      UsernameInputValueKey: getValidationMessage(UsernameInputValueKey),
    });
