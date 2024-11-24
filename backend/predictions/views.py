from django.shortcuts import render
from predictions.models import Predictions
from fastapi import FastAPI, HTTPException
import joblib
import numpy as np
from fastapi.middleware.cors import CORSMiddleware


scaler = joblib.load("scaler.pkl")
poly = joblib.load("poly.pkl")
model = joblib.load("random_forest_model.pkl")

# Define the FastAPI app and endpoint
app = FastAPI()

# Enable CORS

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# Endpoint
@app.post("/predict/")
def predict(input_data: Predictions):
    try:
        # Prepare the input data
        data = np.array([[input_data.fertilizer_use, 
                          input_data.avg_temperature, 
                          input_data.soil_health, 
                          input_data.irrigation_access]])

        # Scale and transform the input
        scaled_data = scaler.transform(data)
        poly_data = poly.transform(scaled_data)

        # Make prediction
        prediction = model.predict(poly_data)
        predicted_yield = prediction[0]

        # Return result
        return {"predicted_yield": f"{predicted_yield:.2f} MT/HA"}

    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))