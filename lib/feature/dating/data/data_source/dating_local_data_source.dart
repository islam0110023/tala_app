import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:tala_app/core/db/cache_helper/cache_helper.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/dating/data/model/scroll_data_model.dart';

abstract class DatingLocalDataSource {
  Future<Unit> saveScroll(int scrollAmount);
  Future<int> getTodayScrollCount();
  Future<Unit> resetScrollIfNewDay();
}

class DatingLocalDataSourceImpl extends DatingLocalDataSource {
  @override
  Future<Unit> saveScroll(int scrollAmount) async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final jsonString = await CacheHelper.getData(
      key: AppConstant.kKeySaveScroll,
    );
    if (jsonString != null) {
      final data = ScrollDataModel.fromJson(json.decode(jsonString));

      if (data.date == today) {
        // Same day → accumulate scroll
        final newData = ScrollDataModel(
          scrollCount: data.scrollCount + scrollAmount,
          date: today,
        );
        await CacheHelper.saveData(
          key: AppConstant.kKeySaveScroll,
          value: json.encode(newData.toJson()),
        );
      } else {
        // Different day → reset
        final newData = ScrollDataModel(scrollCount: scrollAmount, date: today);
        await CacheHelper.saveData(
          key: AppConstant.kKeySaveScroll,
          value: json.encode(newData.toJson()),
        );
      }
    } else {
      // First time
      final newData = ScrollDataModel(scrollCount: scrollAmount, date: today);
      await CacheHelper.saveData(
        key: AppConstant.kKeySaveScroll,
        value: json.encode(newData.toJson()),
      );
    }
    return unit;
  }

  Future<int> getTodayScrollCount() async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final jsonString = await CacheHelper.getData(
      key: AppConstant.kKeySaveScroll,
    );
    if (jsonString != null) {
      final data = ScrollDataModel.fromJson(json.decode(jsonString));
      if (data.date == today) {
        return data.scrollCount;
      }
    }
    return 0;
  }

  Future<Unit> resetScrollIfNewDay() async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final jsonString = await CacheHelper.getData(
      key: AppConstant.kKeySaveScroll,
    );
    if (jsonString != null) {
      final data = ScrollDataModel.fromJson(json.decode(jsonString));
      if (data.date != today) {
        final newData = ScrollDataModel(scrollCount: 0, date: today);
        await CacheHelper.saveData(
          key: AppConstant.kKeySaveScroll,
          value: json.encode(newData.toJson()),
        );
      }
    }
    return unit;
  }
}
