import cv2
import numpy as np

# Initialize the camera
cap = cv2.VideoCapture(0)

# Define the lower and upper boundaries of the hand color in HSV
lower_bound = np.array([0, 20, 70])
upper_bound = np.array([20, 255, 255])

while True:
    ret, frame = cap.read()
    
    if not ret:
        break
    
    # Convert the frame to HSV
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    # Create a mask to extract the hand color
    mask = cv2.inRange(hsv, lower_bound, upper_bound)
    
    # Find contours in the mask
    contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    
    if len(contours) > 0:
        # Find the largest contour (the hand)
        max_contour = max(contours, key=cv2.contourArea)
        
        # Calculate the convex hull of the hand
        hull = cv2.convexHull(max_contour)
        
        # Draw the hand contour and hull
        cv2.drawContours(frame, [max_contour], -1, (0, 255, 0), 2)
        cv2.drawContours(frame, [hull], -1, (0, 0, 255), 2)
        
        # Calculate the area of the hand contour
        area = cv2.contourArea(max_contour)
        
        # Recognize basic gestures based on hand area
        if area > 5000:
            gesture = "Open Hand"
        else:
            gesture = "Closed Fist"
        
        # Display the recognized gesture on the frame
        cv2.putText(frame, gesture, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    cv2.imshow("Hand Gesture Recognition", frame)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
