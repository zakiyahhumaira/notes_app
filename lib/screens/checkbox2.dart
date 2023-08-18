import 'dart:convert'; // Tambahkan impor ini
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void addNote() {
    setState(() {
      notes.add(Note(name: 'Note ${notes.length + 1}', isChecked: false));
      saveNotes();
    });
  }

  void editNoteName(int index, String newName) {
    setState(() {
      notes[index].name = newName;
      saveNotes();
    });
  }

  void deleteNote(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Note'),
          content: Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  notes.removeAt(index);
                  saveNotes();
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void deleteAllNotes() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete All Notes'),
          content: Text('Are you sure you want to delete all notes?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  notes.clear();
                  saveNotes();
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete All'),
            ),
          ],
        );
      },
    );
  }

  void saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notesStringList =
        notes.map((note) => json.encode(note.toMap())).toList();
    await prefs.setStringList('notes', notesStringList);
  }

  void loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notesStringList = prefs.getStringList('notes');
    if (notesStringList != null) {
      setState(() {
        notes = notesStringList
            .map((noteString) => Note.fromMap(json.decode(noteString)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 110, 189, 1),
        title: Text('Note Screen'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: notes[index].isChecked,
              onChanged: (value) {
                setState(() {
                  notes[index].isChecked = value!;
                  saveNotes();
                });
              },
            ),
            title: GestureDetector(
              onTap: () {
                _showEditDialog(index);
              },
              child: Text(notes[index].name),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditDialog(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteNote(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addNote,
            child: Icon(Icons.add),
            mini: true,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: deleteAllNotes,
            child: Icon(Icons.delete_forever),
            mini: true,
          ),
        ],
      ),
    );
  }

  Future<void> _showEditDialog(int index) async {
    TextEditingController textController =
        TextEditingController(text: notes[index].name);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note Name'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                editNoteName(index, textController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Note {
  String name;
  bool isChecked;

  Note({required this.name, required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isChecked': isChecked,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      name: map['name'],
      isChecked: map['isChecked'],
    );
  }
}
