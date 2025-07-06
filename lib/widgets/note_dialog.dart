import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/notes_cubit.dart';
import '../models/note.dart';

Future<void> showNoteDialog(BuildContext context, {Note? note}) async {
  final controller = TextEditingController(text: note?.text);
  final isEdit = note != null;
  final cubit = context.read<NotesCubit>();

  await showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(isEdit ? 'Edit Note' : 'Add Note'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              child: Text(isEdit ? 'Update' : 'Add'),
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  if (isEdit) {
                    cubit.updateNote(note.id, text);
                  } else {
                    cubit.addNote(text);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isEdit ? 'Note updated' : 'Note added'),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
  );
}
