import 'package:flutter/material.dart';
import 'package:radio_elite/style.dart';
import 'package:radio_elite/utils.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: Column(
          children: [
            topWidget(),
            bottomWidget(),
          ],
        ),
      ),
    );
  }
}

class topWidget extends StatelessWidget {
  const topWidget({
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
                    alignment: Alignment.bottomLeft,
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
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

class bottomWidget extends StatelessWidget {
  const bottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();
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
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/twitter.png'),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/instagram.png'),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/linkedin.png'),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/youtube.png'),
          onPressed: () {},
        ),
      ],
    );
  }

  InkWell submitBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Thank you for contacting us"),
              content: Text("We will get back to you soon"),
              actions: [
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
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
