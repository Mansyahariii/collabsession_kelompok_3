import 'package:collabsession/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditEventPage extends StatefulWidget {
  final Activity activity;

  const EditEventPage({super.key, required this.activity});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  final _formKey = GlobalKey<FormState>();
  final SupabaseClient _client = Supabase.instance.client;

  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _locationController;
  late DateTime _selectedDate;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.activity.title);
    _descController = TextEditingController(text: widget.activity.description);
    _locationController = TextEditingController(text: widget.activity.location);
    _selectedDate = widget.activity.date;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _updateEvent() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final response = await _client
          .from('activities')
          .update({
            'title': _titleController.text.trim(),
            'description': _descController.text.trim(),
            'location': _locationController.text.trim(),
            'date': _selectedDate.toIso8601String(),
          })
          .eq('id', widget.activity.id)
          .select();

      debugPrint('UPDATE RESPONSE: $response');

      if (response.isEmpty) {
        throw Exception('No row updated');
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      debugPrint('UPDATE EVENT FAILED: $e');

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Gagal update event')));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const HeroIcon(HeroIcons.chevronLeft, size: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Edit Event',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _input(controller: _titleController, label: 'Judul Event'),
                    _input(controller: _locationController, label: 'Lokasi'),
                    _input(
                      controller: _descController,
                      label: 'Deskripsi',
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (v) => v == null || v.isEmpty ? '$label wajib diisi' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
