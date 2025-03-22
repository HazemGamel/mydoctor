import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

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

  Future<Either<StatusRequest, Map>> getData(String linkurl, {headers}) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = jsonDecode(response.body);
          return Right(reponseBody);
        } else if (response.statusCode == 400 ||
            response.statusCode == 401 ||
            response.statusCode == 402 ||
            response.statusCode == 403 ||
            response.statusCode == 404) {
          return const Left(StatusRequest.failure);
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

  Future<Either<StatusRequest, Map>> updatedata(String linkurl, Map data,
      {headers}) async {
    try {
      if (await checkInternet()) {
        var response = await http.patch(
          Uri.parse(linkurl),
          body: jsonEncode(data),
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = jsonDecode(response.body);
          return Right(reponseBody);
        } else if (response.statusCode == 400 ||
            response.statusCode == 401 ||
            response.statusCode == 402 ||
            response.statusCode == 403 ||
            response.statusCode == 404) {
          return const Left(StatusRequest.failure);
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

  //update with image
  Future postDataWithFile(File image, headers) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest(
            "PATCH", Uri.parse(AppLinkAPi.updateUserProfilePictureApi));
        print(request);
        request.headers.addAll(headers);
        var fileExtension = image.path;

        var length = await image.length();
        var stream = http.ByteStream(image.openRead());

        var multipartFile =
            http.MultipartFile("image", stream, length, filename: image.path);
        request.files.add(multipartFile);

        var myrequest = await request.send();
        var response = await http.Response.fromStream(myrequest);
        final result = jsonDecode(response.body);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = jsonDecode(response.body);
          return Right(reponseBody);
        } else if (response.statusCode == 400 ||
            response.statusCode == 401 ||
            response.statusCode == 402 ||
            response.statusCode == 403 ||
            response.statusCode == 404) {
          return const Left(StatusRequest.failure);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e.toString());
      return const Left(StatusRequest.serverFailure);
    }
  }

  //delete

  Future<Either<StatusRequest, Map>> deleteData(String linkurl,
      {headers}) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(Uri.parse(linkurl), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = jsonDecode(response.body);
          return Right(reponseBody);
        } else if (response.statusCode == 400 ||
            response.statusCode == 401 ||
            response.statusCode == 402 ||
            response.statusCode == 403 ||
            response.statusCode == 404) {
          return const Left(StatusRequest.failure);
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
