import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final TextEditingController _fertilizerController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _soilHealthController = TextEditingController();
  final TextEditingController _irrigationController = TextEditingController();

  String _predictionResult = "";

  Future<void> _makePrediction() async {
    final fertilizer = double.tryParse(_fertilizerController.text);
    final temperature = double.tryParse(_temperatureController.text);
    final soilHealth = double.tryParse(_soilHealthController.text);
    final irrigation = double.tryParse(_irrigationController.text);

    if (fertilizer == null ||
        temperature == null ||
        soilHealth == null ||
        irrigation == null) {
      setState(() {
        _predictionResult = "Please enter valid numerical values for all fields.";
      });
      return;
    }

    // Example: Replace with actual API call
    setState(() {
      _predictionResult =
          "Predicted yield: ${(fertilizer + temperature + soilHealth + irrigation).toStringAsFixed(2)} MT/HA";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Crop Yield Prediction"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Data To Predict",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _fertilizerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Fertilizer Use (KG/HA)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _temperatureController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Average Temperature (°C)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _soilHealthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Soil Health Index (0-100)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _irrigationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Irrigation Access (%)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _makePrediction,
                child: const Text("Predict Yield"),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                _predictionResult,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
