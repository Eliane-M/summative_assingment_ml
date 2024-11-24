from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from typing import Dict

app = FastAPI(title="Crop Yield Prediction API", description="API for predicting crop yields to assist farmers in optimizing harvests.")

# Define the input model
class PredictionInput(BaseModel):
    fertilizer_use: float = Field(..., gt=0, description="Fertilizer use in KG per HA")
    avg_temperature: float = Field(..., gt=-10, lt=50, description="Average temperature in °C")
    soil_health: float = Field(..., gt=0, lt=100, description="Soil health index")
    irrigation_access: float = Field(..., gt=0, lt=100, description="Irrigation access (%)")

# Simulated model for predictions
class CropYieldModel:
    def predict(self, fertilizer_use: float, avg_temperature: float, soil_health: float, irrigation_access: float) -> float:
        # Simulate a simple calculation for crop yield
        return (fertilizer_use * 0.3) + (avg_temperature * 0.2) + (soil_health * 0.4) + (irrigation_access * 0.1)

@app.post("/predict", tags=["Predictions"], response_model=Dict[str, str])
async def predict(input_data: PredictionInput):
    try:
        # Create an instance of the model
        crop_yield_model = CropYieldModel()

        # Generate prediction
        predicted_yield = crop_yield_model.predict(
            input_data.fertilizer_use,
            input_data.avg_temperature,
            input_data.soil_health,
            input_data.irrigation_access,
        )

        # Return the prediction
        return {"predicted_yield": f"{predicted_yield:.2f} MT/HA"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error occurred: {str(e)}")
    
