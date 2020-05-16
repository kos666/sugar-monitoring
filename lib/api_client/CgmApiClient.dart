import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/graph_itself_lol.dart';
import 'package:http/http.dart' as http;

class CgmApiClient {

  final String sugarsApiPath = "";
  final Random _random = Random();

  //todo mocked data - replace with api call
  List<SugarGraphEntry> getSugars() {
    var startTime = DateTime.now().subtract(Duration(minutes: 5));
    var step;
    List<SugarGraphEntry> data = List();

    for( var i = 0 ; i < 2; i++ ) {
      step = _getRandomNumber(1, 2);
      startTime = startTime.add(Duration(minutes: step));
      data.add(new SugarGraphEntry(startTime, _getRandomNumber(60, 200)));
    }

    return data;
  }

  //todo copypasted - move to separate utility class
  int _getRandomNumber(int min, int max) => min + _random.nextInt(max - min);
}

class SugarsRequest {
  final String userId;
  final String from;
  final String to;
  final int size;

  SugarsRequest(this.from, this.to, this.size, this.userId);
}