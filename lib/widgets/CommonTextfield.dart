import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/theme_helper.dart';

// ignore: must_be_immutable
class CommonTextfield extends StatefulWidget {
  final Widget? errodwidget;
  final String? label;
  final bool? isMandatory;
  final bool? isValidated;
  final TextFieldOption? textOption;
  final Function(String text)? textCallback;
  final VoidCallback? tapCallback;
  final VoidCallback? onNextPress;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool showUnderLine;
  final bool enable;
  final BorderSide? border;
  final bool? autoFocus;
  final bool autoCorrect;
  final bool? alignment;
  bool? isObsecure;
  final bool? readOnly;
  final Function(String text)? validation;
  TextStyle? hintStyleText;
  final FocusNode? requestedFocusNode;
  Function? callback;
  final double? margin;
  final double? textFieldHeight;
  final double? textFieldWidth;

  CommonTextfield(
      {this.textOption,
      this.textCallback,
      this.isMandatory,
      this.label,
      this.isValidated,
      this.tapCallback,
      this.onNextPress,
      this.inputAction,
      this.autoFocus,
      this.focusNode,
      this.alignment,
      this.showUnderLine = true,
      this.enable = true,
      this.validation,
      this.autoCorrect = true,
      this.hintStyleText,
      this.errodwidget,
      this.readOnly,
      this.border,
      this.isObsecure,
      this.requestedFocusNode,
      this.callback,
      this.margin,
      this.textFieldHeight,
      this.textFieldWidth});

  @override
  _CommonTextfieldState createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  bool obscureText = false;

  @override
  void didUpdateWidget(CommonTextfield oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!,
          style: appTheme!.text14SemiBolddBlack,
        ),
        Container(
          height: widget.textFieldHeight ?? 35,
          width: widget.textFieldWidth ?? 200,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            // scrollPadding: EdgeInsets.symmetric(vertical: getSize(15)),
            textAlignVertical: TextAlignVertical(y: 0.5),

            //textAlignVertical: TextAlignVertical.center,
            textCapitalization:
                widget.textOption!.keyboardType == TextInputType.text
                    ? TextCapitalization.sentences
                    : TextCapitalization.none,
            readOnly: widget.readOnly ?? false,
            autocorrect: widget.autoCorrect,
            obscuringCharacter: widget.textOption!.obSecureText ?? '∗',
            enabled: widget.enable,
            maxLines: widget.textOption!.maxLine,
            textInputAction: widget.inputAction ?? TextInputAction.done,
            focusNode: widget.focusNode ?? null,
            autofocus: widget.autoFocus ?? false,
            controller: widget.textOption!.inputController,
            obscureText: obscureText,

            style: appTheme!.text14SemiBolddBlack,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            // autovalidate: true,
            keyboardType: widget.textOption!.keyboardType ?? TextInputType.text,
            cursorColor: appTheme!.colorPrimary,
            inputFormatters: widget.textOption!.formatter ?? [],

            decoration: InputDecoration(
              isDense: false,
              errorStyle: appTheme!.text12SemiBoldRed,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              errorMaxLines: 2,
              // helperText: '',

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.grey.withOpacity(0.1),
                      width: 0.5)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.grey.withOpacity(0.1),
                      width: 0.5)),
              // enabledBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.grey.withOpacity(0.4),
                      width: 0.5)),

              focusedBorder:
                  // InputBorder.none,
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: appTheme!.colorPrimary,
                          width: 1)),
              fillColor: widget.textOption!.fillColor ?? appTheme!.whiteColor,
              filled: true,
              labelText: widget.textOption!.labelText,
              enabled: true,
              hintStyle: widget.textOption!.hintStyleText ??
                  appTheme!.text14SemiBolddBlack,
              hintText: widget.textOption!.hintText,
              // contentPadding: EdgeInsets.only(
              //     left: getSize(10), top: getSize(10), bottom: getSize(10)),
              labelStyle: appTheme!.text14SemiBolddBlack,
              prefixIcon: widget.textOption!.prefixWid,
              suffixIcon: (widget.textOption!.isSecureTextField != null &&
                      widget.textOption!.isSecureTextField)
                  ? InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: 15,
                        width: 20,
                      ))
                  : widget.textOption!.type == TextFieldType.DropDown
                      ? IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: appTheme!.grey,
                          ),
                          onPressed: () {},
                        )
                      : widget.textOption!.postfixWid,
            ),

            //     /*onSubmitted: (String text) {
            //       this.widget.textCallback(text);
            //       FocusScope.of(context).unfocus();
            //       if (widget.onNextPress != null) {
            //         widget.onNextPress();
            //       }
            // },*/
            onFieldSubmitted: (String text) {
              FocusScope.of(context).nextFocus();
              widget.focusNode!.unfocus();
              if (widget.onNextPress != null) {
                widget.onNextPress!();
              }
            },

            // validator: widget.validation,
            // onChanged: (String text) {
            //   this.widget.textCallback(text);
            // },

            onEditingComplete: () {
              this
                  .widget
                  .textCallback!(widget.textOption!.inputController!.text);
            },
          ),
        ),
      ],
    );
  }
}

class TextFieldOption {
  String? text = "";
  String? obSecureText;
  String? labelText;
  String? hintText;
  bool isSecureTextField;
  TextInputType? keyboardType;
  TextFieldType? type;
  int maxLine;
  TextStyle? hintStyleText;
  Widget? prefixWid;
  Widget? postfixWid;
  bool? autoFocus;
  bool? enableInteractiveSelection;
  Color? fillColor;
  Padding? padding;
  InputBorder? errorBorder;
  List<TextInputFormatter>? formatter;
  TextEditingController? inputController;

  TextFieldOption(
      {this.text,
      this.labelText,
      this.hintText,
      this.isSecureTextField = false,
      this.keyboardType,
      this.type,
      this.maxLine = 1,
      this.autoFocus,
      this.formatter,
      this.hintStyleText,
      this.inputController,
      this.prefixWid,
      this.postfixWid,
      this.enableInteractiveSelection,
      this.padding,
      this.fillColor,
      this.errorBorder,
      this.obSecureText});
}

enum TextFieldType {
  Normal,
  DropDown,
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
