import 'package:flutter/material.dart';
import 'package:testing4_for_flutter/for_test/services.dart';
import 'conatant.dart';
import 'people_model.dart';

class PeopleController {
  late ServicesData _service;
  PeopleController() {
    _service = ServicesData();
  }

  Future<void> insertPeople(PeopleModel peopleModel) {
    return _service.insertPeople(peopleModel);
  }

  Future<List<PeopleModel>> selectPeople() async {
    var response = await _service.selectPeople(tbPeople) as List;
    List<PeopleModel> peopleList = [];
    response.map((value) {
      debugPrint("People Value: $value");
      return peopleList.add(PeopleModel.fromJson(value));
    }).toList();
    return peopleList;
  }

  Future<void> deletePeople(int peopleId) {
    return _service.deletePeople(tbPeople, peopleId);
  }

  Future<void> updatePeople(PeopleModel peopleModel) {
    return _service.updatePeople(
      tbPeople,
      peopleModel.toJson(),
      peopleModel.id,
    );
  }
}
