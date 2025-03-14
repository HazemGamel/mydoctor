import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mydoctor/core/utilies/enum.dart';

import '../functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data,
      {header}) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl),
            body: jsonEncode(data), headers: header);
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = jsonDecode(response.body);
          print(reponseBody);
          return Right(reponseBody);
        } else if (response.statusCode == 400) {
          return const Left(StatusRequest.failure);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(linkurl),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = jsonDecode(response.body);
          return Right(reponseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
