import cv2
import numpy as np
from pyapriltags import Detector

def detect_apriltags_pyapriltags():
    # Initialize webcam
    cap = cv2.VideoCapture(0)
    
    # Create AprilTag detector
    detector = Detector(families='tag36h11',
                       nthreads=1,
                       quad_decimate=1.0,
                       quad_sigma=0.0,
                       refine_edges=1,
                       decode_sharpening=0.25,
                       debug=0)
    
    while True:
        ret, frame = cap.read()
        if not ret:
            break
            
        # Convert to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        # Detect AprilTags
        results = detector.detect(gray)
        
        # Draw detections
        for r in results:
            # Get corners
            corners = r.corners.astype(int)
            
            # Draw bounding box
            for i in range(4):
                cv2.line(frame, tuple(corners[i]), tuple(corners[(i+1)%4]), 
                        (0, 255, 0), 2)
            
            # Draw center
            center = r.center.astype(int)
            cv2.circle(frame, tuple(center), 5, (0, 0, 255), -1)
            
            # Display tag ID
            cv2.putText(frame, f"ID: {r.tag_id}", tuple(corners[0]), 
                       cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 0, 0), 2)
            
            # Display pose information if available
            if r.pose_t is not None:
                pose_info = f"Dist: {np.linalg.norm(r.pose_t):.2f}"
                cv2.putText(frame, pose_info, tuple(corners[1]), 
                           cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 255), 1)
        
        # Display frame
        cv2.imshow('AprilTag Detection - pyapriltags', frame)
        
        # Exit on 'q' press
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    
    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    detect_apriltags_pyapriltags()