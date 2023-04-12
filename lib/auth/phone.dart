import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EnterPhoneNum extends StatefulWidget {
  const EnterPhoneNum({super.key});

  @override
  State<EnterPhoneNum> createState() => _EnterPhoneNumState();
}

class _EnterPhoneNumState extends State<EnterPhoneNum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              height: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/_1be56d7c-55fe-4efc-bf31-1d597aaa321e.jpeg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: BlurryContainer(
                color: Colors.white.withOpacity(0.15),
                blur: 8,
                elevation: 6,
                height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/app_logo/Icon_960px.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Texts and Styling of them
                    const Text(
                      'Enter your phone number to continue...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Text(
                    //   'A one-stop portal for you to learn the latest technologies from SCRATCH',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(color: Colors.white, fontSize: 16),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: const Size(
                          double.infinity,
                          50,
                        ),
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                      ),
                      onPressed: () async {},
                      label: const Text(
                        'Sign In with Google',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
