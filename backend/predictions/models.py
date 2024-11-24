from django.db import models
from pydantic import Field, BaseModel

class Predictions(BaseModel):
    fertilizer_use: float = Field(..., gt=0, description="Fertilizer use in KG per HA (must be > 0)")
    avg_temperature: float = Field(..., gt=-10, lt=50, description="Average temperature in °C (realistic bounds: -10 to 50°C)")
    soil_health: float = Field(..., gt=0, lt=100, description="Soil health index (0-100)")
    irrigation_access: float = Field(..., gt=0, lt=100, description="Irrigation access in percentage (0-100%)")