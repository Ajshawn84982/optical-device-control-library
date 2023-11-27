# pythob control library for Vialux DMD version=4.2
# include the code for TTL singal control
# author: Shih-Te Hung 2023

import ctypes as ct
import numpy as np
from ALP4 import *
import time

class DMD:
    def __init__(self):
        
        # path to DMD driver, usually in "C:/Program Files/ALP-4.2/ALP-4.2 high-speed API/"
        self.DMD = ALP4(version = '4.2',libDir="C:/Program Files/ALP-4.2/ALP-4.2 high-speed API/")
        # Initialize the device
        self.DMD.Initialize()
        
        self.w=(2**8-1)
        self.b=0
    
    def blank(self):
        
        # apply a white pattern (all mirror is on) on DMD
        # setting the pixel number to self.w means a open pixel, 
        # seeting a pixel to 0 means a closed pixel
        bitDepth = 1
        imgWhite = np.ones([self.DMD.nSizeY,self.DMD.nSizeX])*self.w
        imgSeq    = imgWhite.ravel()
        print(imgWhite.shape)
        # Allocate the onboard memory for the image sequence
        self.DMD.SeqAlloc(nbImg = 1, bitDepth = bitDepth)
        # Send the image sequence as a 1D list/array/numpy array
        self.DMD.SeqPut(imgData = imgSeq)
        # Set image rate to 50 Hz
        self.DMD.SetTiming(pictureTime=1000) # fast repeat the same pattern
        
        # Run the sequence in an infinite loop
        self.DMD.Run()
        # finish the infinity loop by press "enter"
        input("Press Enter to finish...")
        
        # Stop the sequence display
        self.DMD.Halt()
        # Free the sequence from the onboard memory
        self.DMD.FreeSeq()
        
    
    def DMD_tilted_grating_old(self,pitch=6,angle=0,phase=0):
        # input parameters
        # pitch: pitch size of DMD pattern
        # rotation angle of DMD pattern
        # phase shift of DMD pattern
        
        
        # turn the angle of DMD pattern as the DMD chip rotate 45 degree with the optical tabel
        angle=np.deg2rad(angle)
        shape=[self.DMD.nSizeY,self.DMD.nSizeX]
        X = np.arange(shape[1])
        Y = np.arange(shape[0])
        X,Y = np.meshgrid(X,Y)
        
        # rotate the pattern by a define angle
        kx=2*np.pi*np.sin(angle)/pitch
        ky=2*np.pi*np.cos(angle)/pitch
        
        # define the pattern 
        r=np.sin(kx*X+ky*Y+phase)
        
        img=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        # convert to binary pattern: 0,1 pattern
        img[r>=0]=1

        img *= self.w
        imgSeq   = img.ravel()
        # Allocate the onboard memory for the image sequence
        self.DMD.SeqAlloc(nbImg = 1, bitDepth = 1)
        # Send the image sequence as a 1D list/array/numpy array
        self.DMD.SeqPut(imgData = imgSeq)
        # Set image rate to 50 Hz
        self.DMD.SetTiming(pictureTime=1000) # fast repeat the same pattern
        
        # Run the sequence in an infinite loop
        self.DMD.Run()
        
        input("Press Enter to finish...")
        
        # Stop the sequence display
        self.DMD.Halt()
        # Free the sequence from the onboard memory
        self.DMD.FreeSeq()
        
    def DMD_tilted_two_grating_old(self,pitch=6,angle=0,phase=0):
        angle=np.deg2rad(angle)
        shape=[self.DMD.nSizeY,self.DMD.nSizeX]
        X = np.arange(shape[1])
        Y = np.arange(shape[0])
        X,Y = np.meshgrid(X,Y)
        kx=2*np.pi*np.sin(angle)/pitch
        ky=2*np.pi*np.cos(angle)/pitch
        r=np.sin(kx*X+ky*Y+phase)
        imgx=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgx[r>=0]=1
        #xdir = np.cos(angle) 
        #ydir = np.sin(angle)
        
        #img = (((X*xdir + Y*ydir - phase) % pitch) < pitch/2) * 1
        imgx *= self.w
        kx=2*np.pi*np.sin(-angle)/pitch
        ky=2*np.pi*np.cos(angle)/pitch
        r=np.sin(kx*X+ky*Y+phase)
        imgy=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgy[r>=0]=1
        #xdir = np.cos(angle) 
        #ydir = np.sin(angle)
        
        #img = (((X*xdir + Y*ydir - phase) % pitch) < pitch/2) * 1
        imgy *= self.w
        imgSeq  =np.concatenate([imgx.ravel(),imgy.ravel()])
        # Allocate the onboard memory for the image sequence
        self.DMD.SeqAlloc(nbImg = 2, bitDepth = 1)
        # Send the image sequence as a 1D list/array/numpy array
        self.DMD.SeqPut(imgData = imgSeq)
        # Set image rate to 50 Hz
        self.DMD.SetTiming(pictureTime=1000000) # fast repeat the same pattern
        
        # Run the sequence in an infinite loop
        self.DMD.Run()
        
        input("Press Enter to finish...")
        
        # Stop the sequence display
        self.DMD.Halt()
        # Free the sequence from the onboard memory
        self.DMD.FreeSeq()
    
    
    
    def sequential_pattern(self,trigger=False):
        # function description
        # sequential apply x,y pattern on DMD with 3 different phase shift for each
        # synchronize the pattern with external device by TTL signal
        # the synchronization is mastered by DMD
        
        
        # input parameters
        # trigger: whether using trigger in the system 
        
        
        angle=np.deg2rad(45)
        shape=[self.DMD.nSizeY,self.DMD.nSizeX]
        pitch=5.0
        framerate=143.0
        # define the on-time for each pattern
        pictureTime=(np.ceil((1000000/framerate)+200)).astype(np.int64()) #good condition for avoiding drift
        #expperframe: exposure time per simflux prame in the unit of ms

        
        # define 6 patter (2 diraction x 3 phase)
        bitDepth = 1
        X = np.arange(shape[1])
        Y = np.arange(shape[0])
        X,Y = np.meshgrid(X,Y)
        
        shape=[self.DMD.nSizeY,self.DMD.nSizeX]
        X = np.arange(shape[1])
        Y = np.arange(shape[0])
        X,Y = np.meshgrid(X,Y)
        kx=2*np.pi*np.sin(angle)/pitch
        ky=2*np.pi*np.cos(angle)/pitch
        phase=0.0
        r=np.sin(kx*X+ky*Y+phase)
        imgx=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgx[r>=0]=1
        imgx *= self.w
        
        phase=2.0*np.pi/3
        r=np.sin(kx*X+ky*Y+phase)
        imgx1=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgx1[r>=0]=1
        imgx1 *= self.w
        
        phase=4.0*np.pi/3
        r=np.sin(kx*X+ky*Y+phase)
        imgx2=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgx2[r>=0]=1
        imgx2 *= self.w
        
        
        kx=2*np.pi*np.sin(-angle)/pitch
        ky=2*np.pi*np.cos(angle)/pitch
        phase=0.0
        r=np.sin(kx*X+ky*Y+phase)
        imgy=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgy[r>=0]=1
        imgy *= self.w
        
        phase=2.0*np.pi/3
        r=np.sin(kx*X+ky*Y+phase)
        imgy1=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgy1[r>=0]=1
        imgy1 *= self.w
        
        phase=4.0*np.pi/3
        r=np.sin(kx*X+ky*Y+phase)
        imgy2=np.zeros([self.DMD.nSizeY,self.DMD.nSizeX])
        imgy2[r>=0]=1
        imgy2 *= self.w
        
        imgSeq  =np.concatenate([imgx.ravel(),imgx1.ravel(),imgx2.ravel(),imgy.ravel(),imgy1.ravel(),imgy2.ravel()])
        
       
        # Allocate the onboard memory for the image sequence
        self.DMD.SeqAlloc(nbImg = 6, bitDepth = bitDepth)
        # Send the image sequence as a 1D list/array/numpy array
        self.DMD.SeqPut(imgData = imgSeq)
        # Set image rate to 50 Hz
        
        if trigger:
            # define the trigger mode of DMD
            # here, define the DMD as master device
            self.DMD.ProjControl(ALP_PROJ_MODE ,ALP_MASTER)
            self.DMD.SetTiming(pictureTime = pictureTime,synchPulseWidth=1000 ) # fast repeat the same pattern
            
            
        else:
            self.DMD.SetTiming(pictureTime = pictureTime) # fast repeat the same pattern
        # Run the sequence in an infinite loop
        self.DMD.Run()
        
        input("Press Enter to finish...")
        
        # Stop the sequence display
        self.DMD.Halt()
        # Free the sequence from the onboard memory
        self.DMD.FreeSeq()
    

    def __enter__(self):
        return self
    def __exit__(self, *args):
        self.DMD.Halt()
        # Free the sequence from the onboard memory
        #self.DMD.FreeSeq()
        # De-allocate the device
        self.DMD.Free()
        
if __name__=="__main__":
    import time
    with DMD() as dmd:

        dmd.DMD_tilted_two_grating_old(5.0,45,0)


