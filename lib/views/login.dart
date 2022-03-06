import 'package:erpnext_viewer/controllers/login.dart';
import 'package:erpnext_viewer/utils/size.dart';
import 'package:erpnext_viewer/views/base.dart';
import 'package:erpnext_viewer/widgets/button.dart';
import 'package:erpnext_viewer/widgets/state.dart';
import 'package:erpnext_viewer/widgets/text.dart';
import 'package:erpnext_viewer/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final c = Get.put(LoginController());

  LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Obx(
        () => c.busy
            ? const ActivityIndicator()
            : Scaffold(
                key: c.scaffoldKey,
                backgroundColor: Colors.white,
                body: body(),
              ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      toolbarHeight: 60 * UISize.autoSize,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leading: const GetBackButton(),
      centerTitle: true,
      title: const TextBasic(text: ''),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * UISize.autoSize),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: c.keyFormLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200 * UISize.autoSize,
                ),
                SizedBox(height: 40 * UISize.autoSize),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextBasic(
                    text: 'Kullanıcı Girişi',
                    fontSize: UISize.autoSize * 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 20 * UISize.autoSize),
                LoginTextField(
                  obscureText: false,
                  keyboardType: TextInputType.url,
                  hint: 'Sunucu Adresi',
                  controller: c.urlController,
                  focusNode: c.focusUrl,
                  requestFocus: c.focusUsername,
                  prefixIcon: Icon(
                    Icons.link,
                    color: Colors.grey,
                    size: 18.74 * UISize.autoSize,
                  ),
                  validator: (t) {
                    if (t != null) {
                      if (t.isEmpty) {
                        return 'Boş geçilemez';
                      } else if (t.isURL == false) {
                        return 'Sunucu adresi formatı yanlış';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(height: 20 * UISize.autoSize),
                LoginTextField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  hint: 'E-Posta Adresiniz',
                  controller: c.usernameController,
                  focusNode: c.focusUsername,
                  requestFocus: c.focusPassword,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                    size: 18.74 * UISize.autoSize,
                  ),
                  validator: (t) {
                    if (t != null) {
                      if (t.isEmpty) {
                        return 'Boş geçilemez';
                      } else if (t.isEmail == false) {
                        return 'E-posta adresi formatı yanlış';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(height: 20 * UISize.autoSize),
                LoginTextField(
                    obscureText: c.obscureText,
                    hint: 'Şifreniz',
                    controller: c.passwordController,
                    focusNode: c.focusPassword,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => c.setObscureText(!c.obscureText),
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (t) {
                      if (t != null) {
                        if (t.isEmpty) {
                          return 'Boş geçilemez';
                        } else {
                          return null;
                        }
                      }
                    }),
                SizedBox(
                  height: UISize.autoSize * 18.5,
                ),
                Row(
                  children: [
                    Checkbox(
                      tristate: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      activeColor: Colors.orange,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(color: Colors.orange, width: 1 * UISize.autoSize, style: BorderStyle.solid),
                      value: c.rememberMe,
                      onChanged: (value) {
                        c.setRememberMe(!c.rememberMe);
                      },
                    ),
                    TextBasic(
                      text: 'Beni Hatırla',
                      color: Colors.grey,
                      fontSize: 13 * UISize.autoSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 23.5 * UISize.autoSize),
                ButtonBasic(
                  buttonText: 'Giriş',
                  onTap: () {
                    c.login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
