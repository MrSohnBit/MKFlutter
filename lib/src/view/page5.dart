
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mkflutter/src/component/component.dart';


class TabPage5 extends StatelessWidget {
  const TabPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return const CrudPage();
  }
}

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  State<CrudPage> createState() => _CrudPageState();
}

Future<dynamic> _showdialog(BuildContext context, String title, String message, VoidCallback callback) {
  return showDialog(
    context: context,
    builder: (BuildContext context) =>
        CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('취소')),
            CupertinoDialogAction(
                onPressed: () {
                  callback();
                  Navigator.of(context).pop();
                },
                child: const Text('확인')),
          ],
        ),
  );
}

class _CrudPageState extends State<CrudPage> {
  // 할일 목록 저장할 리스트
  final _items = <Todo>[];

  // 할일 문자열 조작을 위한 컨트롤러
  final _todoController = TextEditingController();

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
    });
  }

  void _deleteTodo(Todo todo) {
    _showdialog(context, '알림', '${todo.title}을 삭제 하시겠습니까?', () {
      setState(() {
        _items.remove(todo);

      });

      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("삭제 했습니다."),
      // ));

      Fluttertoast.showToast(
          msg: "삭제 했습니다.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  void initState() {
    _addTodo(Todo('등록1'));
    _addTodo(Todo('등록2'));
    _addTodo(Todo('등록3'));
    super.initState();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  /// 리스트 목록 뷰를 만드는 메서드
  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap: () {
        _toggleTodo(todo);
      },
      title: Text(todo.title,
        style: todo.isDone
            ?const TextStyle(
              decoration: TextDecoration.lineThrough,
              fontStyle: FontStyle.italic,)
            : null,
      ),
      trailing: IconButton(onPressed: () {
          _deleteTodo(todo);
      }, icon: const Icon(Icons.delete_forever)),
    );
  }

  @override
  Widget build(BuildContext context) {

    final inputController = TextEditingController();

    var listWidgets = _items.map((todo) => _buildItemWidget(todo)).toList();
    listWidgets.add(const BottomLayout());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: inputController,

                ),
              ),
              ElevatedButton(
                child: const Text('등록'),
                onPressed: () {
                  if (inputController.text.isEmpty) {
                    return;
                  }
                  _addTodo(Todo(inputController.text));
                },
              ),
            ],
          ),


          Expanded(
            child: ListView(
                // children: _items.map((todo) => _buildItemWidget(todo)).toList()
                children: listWidgets
            ),
          )
        ],
      ),
    );
  }
}


class Todo {
  bool isDone = false;
  String title = "";

  Todo(this.title);
}


