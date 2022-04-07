import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/pages/EditProfile/widgets/avatar_header.dart';
import 'package:flutter_web_dashboard/widgets/CommonTextfield.dart';
import 'package:flutter_web_dashboard/widgets/custom_widget.dart';
import 'package:get/get.dart';

import '../../controllers/menu_controller.dart';
import '../../helpers/reponsiveness.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/top_nav.dart';

class EditProfile extends StatelessWidget {
  MenuController menuController = Get.put(MenuController());
  static const route = 'edit-profile-screen';
  EditProfile({Key? key}) : super(key: key);

  //Variable declartion

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
    return Scaffold(
      backgroundColor: appTheme!.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveWidget.isSmallScreen(context) ? 40 : 100,
            vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: ResponsiveWidget.isSmallScreen(context)
                                ? 56
                                : 6),
                        child: CustomText(
                          text: menuController.activeItem.value,
                          size: 24,
                          weight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome Ashish Suthar',
                style: appTheme!.text18BolddBlack,
              ),
              SizedBox(
                height: 20,
              ),
              avatar(context),
              bioDescription(context),
              firstNameTextField(context),
              lastNameTextField(context),
              emailTextField(context),
              mobileTextField(context),
              bioTextField(context),
              CustomWidgets().getButton(
                () {},
                'Update Account',
                buttonHeight: 40,
                buttonWidth: ResponsiveWidget.isSmallScreen(context)
                    ? 380
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 365
                        : 300,
              )
            ],
          ),
        ),
      ),
    );
  }

  //Avatar-header

  Widget avatar(BuildContext context) => Container(
        width: ResponsiveWidget.isSmallScreen(context) ? 380 : 300,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [profilePic(context), actions()],
        ),
      );

  //Change the profile pic & Delete account buttons

  Widget actions() => Column(
        children: [changeImageButton(), deleteAccountButton()],
      );

  //Change image component

  Widget changeImageButton() => Container(
        height: 40,
        width: 150,
        margin: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: appTheme!.colorPrimary,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Change image',
          style: appTheme!.text12SemiBoldWhite,
        ),
      );

//Delete account component
  Widget deleteAccountButton() => Container(
        height: 40,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: appTheme!.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.4))),
        child: Row(
          children: [
            Icon(
              Icons.delete_forever_outlined,
              color: Colors.red[300],
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Delete account',
              style: appTheme!.text12SemiBoldBlack,
            ),
          ],
        ),
      );

  //Profile-pic avatar

  Widget profilePic(BuildContext context) => CircleAvatar(
        radius: ResponsiveWidget.isSmallScreen(context) ? 50 : 60,
        backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        ),
      );

  //Bio-description

  Widget bioDescription(BuildContext context) => Container(
        width: ResponsiveWidget.isSmallScreen(context) ? 380 : 300,
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquam mauris facilisis arcu faucibus, id venenatis nulla pretium. Integer elementum magna consequat risus ornare maximus. Quisque eu augue ac ex euismod vehicula. In vehicula sodales tellus id scelerisque. In quis metus non arcu aliquet faucibus ut in tellus.  ',
          style: appTheme!.text12RegularGrey,
        ),
      );

  //First-Name text-field

  Widget firstNameTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 40,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 300,
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
                : 300,
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
                : 300,
        focusNode: _emailFocus,
        readOnly: true,
        label: 'E-mail',
        textOption: TextFieldOption(
            inputController: _emailController,
            hintText: 'ashish@mail.com',
            fillColor: appTheme!.grey.withOpacity(0.1),
            keyboardType: TextInputType.emailAddress),
      );

  Widget mobileTextField(BuildContext context) => CommonTextfield(
        textFieldHeight: 40,
        textFieldWidth: ResponsiveWidget.isSmallScreen(context)
            ? 380
            : ResponsiveWidget.isMediumScreen(context)
                ? 365
                : 300,
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
                : 300,
        focusNode: _bioFocusNode,
        label: 'Bio',
        textOption: TextFieldOption(
            inputController: _bioController,
            hintText: 'Describe your-self',
            maxLine: 3,
            keyboardType: TextInputType.text),
      );
}
