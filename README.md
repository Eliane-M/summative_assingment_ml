# Crop Yield Prediction API & Mobile App

## Project Overview
This project provides an API endpoint that predicts crop yield based on input values such as fertilizer use, average temperature, soil health, and irrigation access. The API is available through a publicly routable URL and includes Swagger UI for testing the predictions.

Additionally, this project includes a Flutter-based mobile app that allows users to input their data and receive crop yield predictions.

## API Documentation and Endpoints

The API is built using **FastAPI** and can be accessed through the following publicly available endpoint:

- **Base URL**: `https://your-deployed-api-url.com`
- **Swagger UI Documentation**: You can explore and test the API using Swagger UI at the following link:  
  [Swagger UI](https://your-deployed-api-url.com/docs)

### Endpoint: `/predict`
- **Method**: POST
- **Request Body**:  
  JSON format with the following parameters:
  ```json
 summative_assingment_ml

 You can test the API directly via Swagger UI or using Postman by sending a POST request to the /predict endpoint with the parameters listed below:

{
    "fertilizer_use": 54.98,
    "avg_temperature": 8.93,
    "soil_health": 50.48,
    "irrigation_access": 23.39
  }

Expected answer is: "predicted_yield": "35.67 MT/HA"

# YOUTUBE DEMO OF THE MOBILE APP
Below is a link of a 2-minute video showing how my prediction app works
[Youtube Video](https://youtu.be/35IHir-O0CQ)


# How To Run The App
To run the app follow the following instructions
1. install Flutter and Dart
2. clone the repository and enter the frontend repo using:
   git clone [git-file url](https://github.com/your-username/your-repo.git)
   cd frontend
3. run the command
   flutter pub get
4. run the command
   flutter run

These steps will launch the app and allow you to input data for crop yield prediction.

#NOTES:
The backend (FastAPI) is deployed using a publicly routable URL on render for testing and integration.
The mobile app is built using Flutter and provides a user-friendly interface for interacting with the prediction API.
