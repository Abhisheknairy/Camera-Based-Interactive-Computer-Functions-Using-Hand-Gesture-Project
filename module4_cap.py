#............................LiveCamera with gesture recognize the sign.........................#

import os
import cv2
import time
import numpy as np
from keras.models import load_model
import pyautogui
import time
import warnings
warnings.filterwarnings(action = 'ignore')


model = load_model('CNN_model.h5')

gestures = {
    1:'click',
    2:'dclick',
    3:'down',
    4:'left',
    5:'none',
    6:'rclick',
    7:'right',
    8:'up'

}

def predict(gesture):
    img = cv2.resize(gesture, (50,50))
    img = img.reshape(1,50,50,1)
    img = img/255.0
    prd = model.predict(img)
    index = prd.argmax()
    return gestures[index]

vc = cv2.VideoCapture(0)
rval, frame = vc.read()
old_text = ''
pred_text = ''
count_frames = 0
total_str = ''
flag = True
speed = 0.5
status='1'
while True:
    #time.sleep(10)
   
    if frame is not None: 
        
        frame = cv2.flip(frame, 1)
        frame = cv2.resize( frame, (600,600) )
        
        cv2.rectangle(frame, (400,400), (50,50), (0,255,0), 2)
        
        crop_img = frame[100:300, 100:300]
        grey = cv2.cvtColor(crop_img, cv2.COLOR_BGR2GRAY)
        
        thresh = cv2.threshold(grey,210,255,cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)[1]
      
        blackboard = np.zeros(frame.shape, dtype=np.uint8)
        cv2.putText(blackboard, "Control Mouse Cursor:- ", (30, 40), cv2.FONT_HERSHEY_TRIPLEX, 1, (255, 0, 255))
        if count_frames > 20 and pred_text != "":
            total_str += pred_text
            count_frames = 0
        
        
        if flag == True and status=='1':
            
            pred_text = predict(thresh)
            print(pred_text)
            cv2.putText(blackboard, " "+str(pred_text), (30, 100), cv2.FONT_HERSHEY_TRIPLEX, 1, (255, 0, 255))
            old_text = pred_text
            #f = open('output.txt','w')
            #f.write(str(pred_text))
            #f.close()

            if str(pred_text)=='click':
                res = 'click'
                print(res)
                pyautogui.click()
                
            elif str(pred_text)=='rclick':
                res = 'rclick'
                print(res)
                pyautogui.click(button='right')
                
                
            elif str(pred_text)=='dclick':
                res = 'dclick'
                print(res) 
                pyautogui.doubleClick()
                
            elif str(pred_text)=='down':
                res = 'down'
                print(res)
                pyautogui.moveRel(0, 10, duration=speed)
                time.sleep(0.5)     
                 
            elif str(pred_text)=='left':
                res = 'left'
                print(res)
                pyautogui.move(-100, -100, duration=0)  # Move 100 pixels up and 100 pixels left instantly

            elif str(pred_text)=='none':
                res = 'none'
                print(res)
                
            elif str(pred_text)=='right':
                res = 'right'
                print(res)
                pyautogui.move(100, 0, duration=1)  # Move 100 pixels to the right over 1 second
                #pyautogui.dragTo(600, 600, duration=2)
                #pyautogui.dragRel(100, 0, duration=1)
                
            
            
            elif str(pred_text)=='up':
                res = 'up'
                print(res)
                #pyautogui.scroll(10)
                pyautogui.moveRel(0, -10, duration=speed)
                time.sleep(0.5)
                
            
            
            print('res',res)
            
            cv2.putText(blackboard, res, (30, 70), cv2.FONT_HERSHEY_TRIPLEX, 1, (255, 0, 255))
            
            f = open('result.txt','w')
            f.write(str(res))
            f.close()
            if old_text == pred_text:
                count_frames += 1                
            else:
                count_frames = 0
        
            

            #cv2.putText(blackboard, total_str, (30, 80), cv2.FONT_HERSHEY_TRIPLEX, 1, (0, 255, 0))
        res = np.hstack((frame, blackboard))
        
        cv2.imshow("image", res)
        #cv2.imshow("hand", thresh)
        #time.sleep(1)
    rval, frame = vc.read()
    keypress = cv2.waitKey(1)
    flag=False
    if keypress == ord('c'):
        flag = True
    if keypress == ord('q'):
        break

vc.release()
cv2.destroyAllWindows()
cv2.waitKey(1)
vc.release()

    