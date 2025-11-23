import 'package:flutter/material.dart';
import 'package:flutter_daily/todo/home.dart';

/// 交互想法:
/// 点击添加/编辑，从底部弹起来
///  - 支持输入标题
///  - 支持输入明细
///  - 选择日起
///    - 弹窗显示日期选择
///    - 封装通用弹窗
/// 支持点击删除，需要二次确认；左滑删除无二次确认
/// 使用dio封装请求
/// 需要用户登录，数据隔离（使用shared_preferences存储用户信息）
/// ToDo列表，支持上拉刷新，下拉加载
///
/// 整体页面设计
///   - 启动页
///     - 选择去登录/去注册
///   - 登录/注册页
///   - todo 列表页
///     - 全部/未完成/已完成
///   - 统计页（支持时间筛选，用户名筛选）
///   - 异步事件需要添加loading效果
///   - 明细页(也支持点击编辑删除，编辑/删除)
///     - 点击返回，需要对列表进行刷新（根据单双数实现两种刷新方式）
///   - 用户反馈
///
/// Flutter 使用技术点
///   - dio 封装请求
///   - shared_preferences
///   - flutter_screenutil
///   - flutter_easyloading
///   - ToDo 列表使用 Tab（全部/未完成/已完成）
///   - 密码加密
///   - eventbus 事件通信、父传子、子传父(回调函数)
///   - 上传图片（封装通用上传图片）
///   - 封装下拉加载、上拉刷新
///   - 封装通用弹窗（底部弹起、弹中间）
///   - 防抖/节流
///   - Table 实现表格统计（管理层）
///
/// 数据设计
/// users
///  - id
///  - nickname
///  - password
///  - avatar
///  - createdAt
///  - updateAd
///
/// todos
///  - id
///  - title
///  - descript
///  - deadline
///  - completed
///  - createdAt
///  - updateAd
///
/// feedback

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => ToDoAppState();
}

class ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme:
          ThemeData(primarySwatch: Colors.yellow, primaryColor: Colors.yellow),
    );
  }
}
