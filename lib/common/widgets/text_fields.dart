import 'package:flutter/services.dart';
import 'package:tn_edii/constants/size_unit.dart';

import 'package:tn_edii/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class TextFormFieldCustom extends StatefulWidget {
  final TextEditingController controller;

  final String? label, hint;
  final TextInputType? keyboardType;
  final bool isOptional;
  final bool? enabled;
  final bool isCaptalizeAll, obscured;
  final Widget? suffix, prefix;
  final String? Function(String? input)? validator;
  final BorderRadius? borderRadius;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool isBorderLess;
  final int? maxLength;

  const TextFormFieldCustom({
    super.key,
    required this.controller,
    this.label,
    this.keyboardType,
    this.isOptional = false,
    this.enabled,
    this.validator,
    this.isCaptalizeAll = false,
    this.obscured = false,
    this.suffix,
    required this.hint,
    this.prefix,
    this.borderRadius,
    this.onChanged,
    this.onTap,
    this.isBorderLess = true,
    this.maxLength,
  });

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      readOnly: widget.onTap != null,
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      inputFormatters: getInputFormatters,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: widget.obscured && !isVisible,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (i) {
        String input = i ?? '';
        // Checks if the field is optional and input is empty
        if (!widget.isOptional && input.isEmpty) {
          return "The ${widget.label} is required";
        }
        if (!widget.isOptional &&
            widget.keyboardType == TextInputType.emailAddress &&
            !input.isEmail) {
          return "Kindly enter valid mail";
        }
        if (!widget.isOptional &&
            widget.maxLength != null &&
            input.length != widget.maxLength) {
          return '${widget.label} must be ${widget.maxLength} digit';
        }
        // If the validator is not null custom validation logic to be performed
        if (widget.validator != null) {
          return widget.validator!(input);
        }
        // No validation errors
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: widget.prefix,
          suffixIcon: suffix,
          errorStyle: const TextStyle(fontSize: 13, color: Palette.red),
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          labelText: widget.label,
          hintText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
          border: ThemeGuide.focussedBorder,
          errorBorder: ThemeGuide.errorBorder,
          enabledBorder: ThemeGuide.defaultBorder(color: Palette.grey),
          focusedBorder: ThemeGuide.focussedBorder),
    );
  }

  Widget? get suffix {
    return widget.obscured
        ? InkWell(
            onTap: () {
              isVisible = !isVisible;
              setState(() {});
            },
            child: !isVisible
                ? const Icon(
                    Icons.visibility_off_outlined,
                    size: 18,
                  )
                : const Icon(
                    Icons.visibility_outlined,
                    size: 18,
                  ),
          )
        : widget.suffix;
  }

  List<TextInputFormatter> get getInputFormatters {
    if (widget.keyboardType == TextInputType.number ||
        widget.keyboardType == const TextInputType.numberWithOptions()) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    if (widget.isCaptalizeAll) {
      return [UpperCaseTextFormatter()];
    }
    if (widget.keyboardType == TextInputType.emailAddress) {
      return [LowerCaseTextFormatter()];
    }
    return <TextInputFormatter>[];
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class FeedbackTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final double? height;
  final TextInputType? textInputType;
  const FeedbackTextfield(
      {super.key,
      required this.controller,
      this.hint,
      this.textInputType,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 150,
        decoration: const BoxDecoration(color: Palette.pureWhite),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          obscureText: false,
          cursorColor: Palette.primary,
          style: const TextStyle(),
          decoration: InputDecoration(
              fillColor: Palette.pureWhite,
              filled: false,
              counterText: "",
              hintText: hint,
              contentPadding: const EdgeInsets.all(12),
              hintStyle:
                  TextStyle(fontSize: 12, color: Palette.grey.withOpacity(0.8)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Palette.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.3)))),
        ));
  }
}
