from django.urls import path
from .views import predict

urlpatterns = [
    path("predict/", predict, name="predict_crop_yield"),
]