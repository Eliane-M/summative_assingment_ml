import joblib
import numpy as np

class CropYieldModel:
    def __init__(self):
        # Load pre-trained model, scaler, and polynomial transformer
        self.scaler = joblib.load("scaler.pkl")
        self.poly = joblib.load("poly.pkl")
        self.model = joblib.load("random_forest_model.pkl")

    def predict(self, fertilizer_use, avg_temperature, soil_health, irrigation_access):
        # Prepare input data
        data = np.array([[fertilizer_use, avg_temperature, soil_health, irrigation_access]])
        scaled_data = self.scaler.transform(data)
        poly_data = self.poly.transform(scaled_data)

        # Predict
        prediction = self.model.predict(poly_data)
        return prediction[0]
