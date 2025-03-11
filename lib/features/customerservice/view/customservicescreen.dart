import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

class Customservicescreen extends StatelessWidget {
  const Customservicescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/67cef0926aab7719142ba3dc/1im05nfh4',
        visitor: TawkVisitor(
          name: 'Hazem',
          email: 'hazem@gmail.com',
        ),
        onLoad: () {
          // print('Hello Tawk!');
        },
        onLinkTap: (String url) {
          // print(url);
        },
        placeholder: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
