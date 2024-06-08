import 'dart:io'; // Import for handling files

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackmate/shared/theme.dart';

class AddVehiclePage extends StatefulWidget {
  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final TextEditingController licensePlateController = TextEditingController();
  final TextEditingController brandModelController = TextEditingController();
  XFile? vehiclePhoto;
  XFile? stnkPhoto;
  XFile? bpkbPhoto;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, String type) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (type == 'vehicle') {
        vehiclePhoto = pickedFile;
      } else if (type == 'stnk') {
        stnkPhoto = pickedFile;
      } else if (type == 'bpkb') {
        bpkbPhoto = pickedFile;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vehicle', style: whiteText),
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildImagePicker('Vehicle Photo', 'vehicle', vehiclePhoto),
            SizedBox(height: 16),
            _buildTextField(licensePlateController, 'License Plate'),
            SizedBox(height: 16),
            _buildTextField(brandModelController, 'Brand and Model'),
            SizedBox(height: 16),
            _buildImagePicker('STNK Photo', 'stnk', stnkPhoto),
            SizedBox(height: 16),
            _buildImagePicker('BPKB Photo', 'bpkb', bpkbPhoto),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle save data logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    purpleColor, // Use backgroundColor instead of primary
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Save Data', style: whiteText),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker(String label, String type, XFile? image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: blackText.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            _showImageSourceDialog(type);
          },
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: image == null
                ? Center(child: Text('Choose a photo', style: darkGreyText))
                : Image.file(File(image.path),
                    fit: BoxFit.cover), // Convert XFile to File
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _showImageSourceDialog(String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose source'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.camera, type);
            },
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.gallery, type);
            },
            child: Text('Gallery'),
          ),
        ],
      ),
    );
  }
}
