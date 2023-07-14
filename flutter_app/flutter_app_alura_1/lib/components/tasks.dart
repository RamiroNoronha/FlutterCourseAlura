import 'package:flutter/material.dart';

import 'difficulty.dart';

class Tasks extends StatefulWidget {
  const Tasks({
    Key? key,
    required this.difficulty,
    required this.name,
    required this.photo,
  }) : super(key: key);
  final int difficulty;
  final String name;
  final String photo;
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int level = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.difficulty > 0
                              ? (level / widget.difficulty) / 10
                              : 1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Nível $level'),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            widget.photo,
                            width: 72,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Difficulty(difficulty: widget.difficulty),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            height: 52,
                            width: 52,
                            child: ElevatedButton(
                              onPressed: _onPressedLevel,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.arrow_drop_up_sharp,
                                    size: 20,
                                  ),
                                  Text(
                                    'UP',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _onPressedLevel() {
    if (mounted && (level / widget.difficulty) / 10 < 1) {
      setState(() {
        level++;
      });
    }
  }
}
