import 'package:flutter/material.dart';
import 'package:flutter_daily/navigation/01_anonymous.dart';
import 'package:flutter_daily/navigation/02_namedRoute.dart';
import 'package:flutter_daily/navigation/03_onGenerateRoute.dart';
import 'package:flutter_daily/tabbar/01_tabbar.dart';
import 'package:flutter_daily/tabbar/02_tabbar.dart';
import 'package:flutter_daily/todo/app.dart';

void main() {
  // 匿名路由例子
  // runApp(const AnonymousApp());

  // 命令路由例子
  // runApp(const NamedRouteApp());

  // 动态路由例子
  // runApp(const GenerateRouteApp());

  // TabBar例子
  // runApp(const TabBarApp());

  // TabBar例子02
  // runApp(const TabBarApp02());

  // 待办事项例子
  runApp(const ToDoApp());
}
