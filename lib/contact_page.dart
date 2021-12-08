import 'package:flutter/material.dart';
import 'package:radio_elite/style.dart';
import 'package:radio_elite/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: Column(
          children: [
            const TopWidget(),
            BottomWidget(),
          ],
        ),
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            gradient: LinearGradient(
                colors: [
                  Color(0xFF558DE2),
                  Color(0xFF474747),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp),
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 50.0, right: 20.0),
            child: Stack(
              children: [
                Image.asset(
                  'assets/map.png',
                  fit: BoxFit.fitWidth,
                ),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.bottomCenter,
                    child: gradientText(Utils.address, 15)),
              ],
            ),
          ),
        ));
  }
}

final Shader linearGradient = const LinearGradient(
  colors: [
    Color(0xFFE1AF33),
    Color(0xFFFDFB51),
  ],
).createShader(
  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

// ignore: must_be_immutable
class BottomWidget extends StatelessWidget {
  BottomWidget({
    Key? key,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                gradientText(Utils.freeToContact, 20),
                const SizedBox(height: 20.0),
                generateTextfield("Name", nameController),
                const SizedBox(height: 20.0),
                generateTextfield("Your email Address", emailController),
                const SizedBox(height: 20.0),
                generateTextfield("Message", messageController),
                const SizedBox(height: 20.0),
                submitBtn(context),
                const SizedBox(height: 20.0),
                gradientText("Follow Us", 20),
                const SizedBox(height: 10.0),
                socialMediaContact(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ));
  }

  Row socialMediaContact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset('assets/facebook.png'),
          onPressed: () {
            _launchURL(
                "https://www.facebook.com/Radio-Elite-International-106096355205022");
          },
        ),
        IconButton(
          icon: Image.asset('assets/twitter.png'),
          onPressed: () {
            _launchURL("https://twitter.com/RadioElite2");
          },
        ),
        IconButton(
          icon: Image.asset('assets/instagram.png'),
          onPressed: () {
            _launchURL("https://www.instagram.com/radioeliteinternational/");
          },
        ),
        IconButton(
          icon: Image.asset('assets/linkedin.png'),
          onPressed: () {
            _launchURL(
                "https://www.linkedin.com/company/radio-elite-international/");
          },
        ),
      ],
    );
  }

  //send an email
  void _sendEmail(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      Utils.showSnackBar(context, "Please fill all the fields");
      return;
    }
    const String subject = "Mail From Radio Elite App";
    final String body =
        "Name: ${nameController.text}\nEmail: ${emailController.text}\nMessage: ${messageController.text}";
    const String email = "radioeliteinternational@gmail.com";
    final String url = "mailto:$email?subject=$subject&body=$body";
    _launchURL(url);
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  InkWell submitBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        _sendEmail(context);
      },
      child: Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        decoration: btnBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: gradientText("Submit", 18),
        ),
      ),
    );
  }

  TextField generateTextfield(String text, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          foreground: Paint()..shader = linearGradient,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow, width: 0.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
