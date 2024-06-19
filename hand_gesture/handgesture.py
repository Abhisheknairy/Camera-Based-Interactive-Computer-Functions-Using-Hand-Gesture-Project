import cv2
import numpy as np
import tensorflowjs as tfjs

# Load the exported TensorFlow.js model
model = tfjs.converters.load_model('C:\Users\hp\OneDrive\Desktop\hand_gesture')

# Initialize the camera
cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()

    if not ret:
        break

    # Preprocess the frame (resize, crop, normalize)

    # Pass the preprocessed frame through the model for prediction
    # The model should return the recognized sign language alphabet letter

    # Display the recognized alphabet letter on the frame

    cv2.imshow("Sign Language Recognition", frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
