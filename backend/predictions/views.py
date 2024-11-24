from django.http import JsonResponse
from fastapi import FastAPI
from pydantic import BaseModel, Field, ValidationError
from .models import CropYieldModel
from django.views.decorators.csrf import csrf_exempt
import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")
django.setup()

app = FastAPI()

# Define a Pydantic model for input validation
class PredictionInput(BaseModel):
    fertilizer_use: float = Field(..., gt=0, description="Fertilizer use in KG per HA")
    avg_temperature: float = Field(..., gt=-10, lt=50, description="Average temperature in °C")
    soil_health: float = Field(..., gt=0, lt=100, description="Soil health index")
    irrigation_access: float = Field(..., gt=0, lt=100, description="Irrigation access (%)")

@csrf_exempt
@app.post('/predict')
def predict(input: PredictionInput):
    try:
        # instance of the model
        crop_yield_model = CropYieldModel()

        # The prediction
        predicted_yield = crop_yield_model.predict(
            input.fertilizer_use,
            input.avg_temperature,
            input.soil_health,
            input.irrigation_access,
        )

        # Returning the result
        return JsonResponse({"predicted_yield": f"{predicted_yield:.2f} MT/HA"}, status=200)

    except ValidationError as e:
        # Handle input validation errors
        return JsonResponse({"error": e.errors()}, status=400)
    except Exception as e:
        # Handle other exceptions
        return JsonResponse({"error": str(e)}, status=500)
