import 'package:flutter/material.dart';
import 'package:test_app/home/home_page.dart';

// ignore: must_be_immutable
class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});
  TextEditingController otpVerificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: otpVerificationController,
              onChanged: (val) {},
              decoration: const InputDecoration(hintText: "Enter 6-digit Otpr"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
