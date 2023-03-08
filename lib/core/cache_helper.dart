import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
   static late SharedPreferences cache ;
   static initialObject() async{
     cache = await SharedPreferences.getInstance();
   }

   static void saveData(String key,dynamic value) {
     if(value is String) {
       debugPrint("$value is saved..");
       cache.setString(key, value).then((value){
       }).catchError((error){
         debugPrint(error.toString());
       });
     } else if(value is int){
       debugPrint("$value is saved..");
       cache.setInt(key, value).then((value){
       }).catchError((error){
         debugPrint(error.toString());
       });
     }else if(value is bool){
       debugPrint("$value is saved..");
       cache.setBool(key, value).then((value){
       }).catchError((error){
         debugPrint(error.toString());
       });
     }else
     {
       debugPrint("$value is saved..");
     cache.setDouble(key, value).then((value){
       }).catchError((error){
         debugPrint(error.toString());
       });
     }
   }


   static dynamic getData(String key) {
     return cache.get(key);
   }

   static Future<bool> removeData(String key) async {
     return await cache.remove(key);
   }
}