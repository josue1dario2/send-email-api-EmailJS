

import 'package:flutter/material.dart';
import 'package:send_email/send_email.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Send Email",
      initialRoute: 'formulario',
      routes: {
        'formulario': (BuildContext context) => SendEmail(),
      },
    );
  }
}


Future sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async{

  final serviceId = 'service_bty40wu';
  final templateId = 'template_bue5had';
  final userId = 'user_Zj9FvyLhEUY7RlqJedxRu';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'origin': 'http//localhost',
      'Content-type': 'application/json',
    },
    body: json.encode(
      {
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name':name,
          'user_email':email,
          'to_email': 'other.email@gmail.com',
          'user_subject':subject,
          'user_message': message,
        }
      },
    )
  );

  print(response.body);
}

