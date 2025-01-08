import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  
  {
    'icon':FaIcon(FontAwesomeIcons.burger,color: Colors.white,),
      'color':Colors.yellow,
    'name': 'Food',
    'totalAmount':'Rs 40.00',
    'date':'Today'
  },
  {
    'icon':FaIcon(FontAwesomeIcons.bagShopping,color: Colors.white,),
      'color':Colors.purple,
    'name': 'Shopping',
    'totalAmount':'Rs 250.00',
    'date':'Today'
  },
  {
    'icon':FaIcon(FontAwesomeIcons.heartCircleCheck,color: Colors.white,),
      'color':Colors.green,
    'name': 'Health',
    'totalAmount':'Rs 400.00',
    'date':'Yesterday'
  },
  {
    'icon':FaIcon(FontAwesomeIcons.plane,color: Colors.white,),
      'color':Colors.blue,
    'name': 'Travel',
    'totalAmount':'Rs 1400.00',
    'date':'Yesterday'
  },
];