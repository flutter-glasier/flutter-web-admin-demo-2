import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/widgets/custom_widget.dart';

import '../../../helpers/reponsiveness.dart';
import '../../../helpers/theme_helper.dart';
import '../../../widgets/CommonTextfield.dart';

class NewClientForm extends StatelessWidget {
  //TextEditing Controller for form

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  //FocusNodes for form

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _mobileNumberFocus = FocusNode();
  final FocusNode _bioFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              padding: EdgeInsets.only(right: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.clear)),
          Text(
            'Add a new client',
            style: appTheme!.text18BolddBlack,
          ),
          SizedBox(
            height: 30,
          ),
          firstNameTextField(context),
          lastNameTextField(context),
          emailTextField(context),
          mobileTextField(context),
          bioTextField(context),
          uploadImageDialog(),
          CustomWidgets().getButton(() {}, 'Submit', buttonWidth: 400)
        ],
      ),
    );
  }

  //First-Name text-field

  Widget firstNameTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 40,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 400,
        focusNode: _firstNameFocus,
        label: 'First-Name',
        textOption: TextFieldOption(
            inputController: _firstNameController,
            hintText: 'Enter your first-name'),
      );

  //Last-Name text-field

  Widget lastNameTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 40,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 400,
        focusNode: _lastNameFocus,
        label: 'Last-Name',
        textOption: TextFieldOption(
            inputController: _lastNameController,
            hintText: 'Enter your last-name'),
      );

  //Last-Name text-field

  Widget emailTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 40,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 400,
        focusNode: _emailFocus,
        validation: (v) {
          if (v.isEmpty) {
            return 'Kindly enter a email address';
          }
        },
        label: 'E-mail',
        textOption: TextFieldOption(
            inputController: _emailController,
            hintText: 'ashish@mail.com',
            keyboardType: TextInputType.emailAddress),
      );

  Widget mobileTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 40,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 400,
        focusNode: _mobileNumberFocus,
        label: 'Phone-number',
        textOption: TextFieldOption(
            inputController: _mobileNumberController,
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone),
      );

  Widget bioTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 70,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 400,
        focusNode: _bioFocusNode,
        label: 'Bio',
        textOption: TextFieldOption(
            inputController: _bioController,
            hintText: 'Describe your-self',
            maxLine: 3,
            keyboardType: TextInputType.text),
      );

  Widget uploadImageDialog() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload Profile-image'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 400,
            height: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: appTheme!.grey.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload Image',
                  style: appTheme!.text12RegularGrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.cloud_upload_outlined,
                  color: appTheme!.grey,
                )
              ],
            ),
          ),
        ],
      );
}
