// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:currency_converter/ui/common/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String QuantityValueKey = 'quantity';

final Map<String, TextEditingController>
    _CurrencyConverterViewTextEditingControllers = {};

final Map<String, FocusNode> _CurrencyConverterViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CurrencyConverterViewTextValidations = {
  QuantityValueKey: FormValidators.validateUnsignInteger,
};

mixin $CurrencyConverterView on StatelessWidget {
  TextEditingController get QuantityController =>
      _getFormTextEditingController(QuantityValueKey, initialValue: '1');
  FocusNode get QuantityFocusNode => _getFormFocusNode(QuantityValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CurrencyConverterViewTextEditingControllers.containsKey(key)) {
      return _CurrencyConverterViewTextEditingControllers[key]!;
    }
    _CurrencyConverterViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CurrencyConverterViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CurrencyConverterViewFocusNodes.containsKey(key)) {
      return _CurrencyConverterViewFocusNodes[key]!;
    }
    _CurrencyConverterViewFocusNodes[key] = FocusNode();
    return _CurrencyConverterViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    QuantityController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the dynamic
  void _updateFormData(dynamic model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          QuantityValueKey: QuantityController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        QuantityValueKey: _getValidationMessage(QuantityValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CurrencyConverterViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _CurrencyConverterViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _CurrencyConverterViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CurrencyConverterViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CurrencyConverterViewTextEditingControllers.clear();
    _CurrencyConverterViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get quantityValue => this.formValueMap[QuantityValueKey] as String?;

  bool get hasQuantity => this.formValueMap.containsKey(QuantityValueKey);

  bool get hasQuantityValidationMessage =>
      this.fieldsValidationMessages[QuantityValueKey]?.isNotEmpty ?? false;

  String? get quantityValidationMessage =>
      this.fieldsValidationMessages[QuantityValueKey];
}

extension Methods on FormViewModel {
  setQuantityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QuantityValueKey] = validationMessage;
}
