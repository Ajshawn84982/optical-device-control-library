

import sys
from .smaract import ctl as ctl
#import smaract.ctl as ctl
import time
import numpy as np
class smaractmcs2:
    def __init__(self):
        
        """
        Checks that the major version numbers of the Python API and the
        loaded shared library are the same to avoid errors due to 
        incompatibilities.
        Raises a RuntimeError if the major version numbers are different.
        """
        vapi = ctl.api_version
        vlib = [int(i) for i in ctl.GetFullVersionString().split('.')]
        if vapi[0] != vlib[0]:
            raise RuntimeError("Incompatible SmarActCTL python api and library version.")
            
        try:
            buffer = ctl.FindDevices()
            if len(buffer) == 0:
                print("MCS2 no devices found.")
                exit(1)
            locators = buffer.split("\n")
            for locator in locators:
                print("MCS2 available devices: {}".format(locator))
        except:
            print("MCS2 failed to find devices. Exit.")
            input()
            sys.exit(1)
        
        d_handle = ctl.Open(locators[0])
        
        print("MCS2 opened {}.".format(locators[0]))
        
        for channel in range(3):
            # We start by setting some general channel properties.
            type = ctl.GetProperty_i32(d_handle, channel, ctl.Property.CHANNEL_TYPE)
            if type == ctl.ChannelModuleType.STICK_SLIP_PIEZO_DRIVER:
                # Set max closed loop frequency (maxCLF) to 6 kHz. This properties sets a limit for the maximum actuator driving frequency.
                # The maxCLF is not persistent thus set to a default value at startup.
                ctl.SetProperty_i32(d_handle, channel, ctl.Property.MAX_CL_FREQUENCY, 6000)
                # The hold time specifies how long the position is actively held after reaching the target.
                # This property is also not persistent and set to zero by default.
                # A value of 0 deactivates the hold time feature, the constant ctl.HOLD_TIME_INFINITE sets the time to infinite.
                # (Until manually stopped by "Stop") Here we set the hold time to 1000 ms.
                ctl.SetProperty_i32(d_handle, channel, ctl.Property.HOLD_TIME, 1000)
            elif type == ctl.ChannelModuleType.PIEZO_SCANNER_DRIVER:
                # Enable the amplifier.
                ctl.SetProperty_i32(d_handle, channel, ctl.Property.AMPLIFIER_ENABLED, ctl.TRUE)
                # The hold time specifies how long the position is actively held after reaching the target.
                # This property is also not persistent and set to zero by default.
                # A value of 0 deactivates the hold time feature, the constant ctl.HOLD_TIME_INFINITE sets the time to infinite.
                # (Until manually stopped by "Stop") Here we set the hold time to 1000 ms.
                ctl.SetProperty_i32(d_handle, channel, ctl.Property.HOLD_TIME, 1000)
            elif type == ctl.ChannelModuleType.MAGNETIC_DRIVER:
                # Enable the amplifier (and start the phasing sequence).
                ctl.SetProperty_i32(d_handle, channel, ctl.Property.AMPLIFIER_ENABLED, ctl.TRUE)

        # The move mode states the type of movement performed when sending the "Move" command.
        move_mode = ctl.MoveMode.CL_ABSOLUTE
        self.move_mode=move_mode
        for channel in range(3):
            ctl.SetProperty_i32(d_handle, channel, ctl.Property.MOVE_MODE, move_mode)
            
            ctl.SetProperty_i64(d_handle, channel, ctl.Property.MOVE_VELOCITY, 500000000)
            # Set move acceleration [in pm/s2].
            ctl.SetProperty_i64(d_handle, channel, ctl.Property.MOVE_ACCELERATION, 10000000000)
        self.d_handle=d_handle
    def move(self,p):
        # move_value p in nm
        for i in range(3):
            ctl.Move(self.d_handle, i, np.round(p[i]*1000).astype(np.int64), 0) #in smaract the move_value is defined in pm unit
    
    def position(self):
        p=np.zeros([3])
        for channel in range(3):
            position = ctl.GetProperty_i64(self.d_handle, channel, ctl.Property.POSITION)
            p[channel]=position*1e-3 # get position in nm unit
        return p
    
    def zstack(self,range_nm,steps):
        z=np.linspace(-range_nm,range_nm,steps)
        for i in range(10):
            self.move(0,1)
            time.sleep(0.3)
    
    def calibrate(self):
        channel=0
        print("MCS2 start calibration on channel: {}.".format(channel))
        # Set calibration options (start direction: forward)
        ctl.SetProperty_i32(self.d_handle, channel, ctl.Property.CALIBRATION_OPTIONS, 0)
        # Start calibration sequence
        ctl.Calibrate(self.d_handle, channel)
        time.sleep(2)
        channel=1
        print("MCS2 start calibration on channel: {}.".format(channel))
        # Set calibration options (start direction: forward)
        ctl.SetProperty_i32(self.d_handle, channel, ctl.Property.CALIBRATION_OPTIONS, 0)
        # Start calibration sequence
        ctl.Calibrate(self.d_handle, channel)
        time.sleep(2)
        channel=2
        print("MCS2 start calibration on channel: {}.".format(channel))
        # Set calibration options (start direction: forward)
        ctl.SetProperty_i32(self.d_handle, channel, ctl.Property.CALIBRATION_OPTIONS, 0)
        # Start calibration sequence
        ctl.Calibrate(self.d_handle, channel)
        time.sleep(2)
        # Note that the function call returns immediately, without waiting for the movement to complete.
        # The "ChannelState.CALIBRATING" flag in the channel state can be monitored to determine
        # the end of the calibration sequence.
    
    def findReference(self):
        for channel in range(3):
            print("MCS2 find reference on channel: {}.".format(channel))
            # Set find reference options.
            # The reference options specify the behavior of the find reference sequence.
            # The reference flags can be ORed to build the reference options.
            # By default (options = 0) the positioner returns to the position of the reference mark.
            # Note: In contrast to previous controller systems this is not mandatory.
            # The MCS2 controller is able to find the reference position "on-the-fly".
            # See the MCS2 Programmer Guide for a description of the different modes.
            ctl.SetProperty_i32(self.d_handle, channel, ctl.Property.REFERENCING_OPTIONS, 0)
            # Set velocity to 1mm/s
            ctl.SetProperty_i64(self.d_handle, channel, ctl.Property.MOVE_VELOCITY, 1000000000)
            # Set acceleration to 10mm/s2.
            ctl.SetProperty_i64(self.d_handle, channel, ctl.Property.MOVE_ACCELERATION, 10000000000)
            # Start referencing sequence
            ctl.Reference(self.d_handle, channel)
            time.sleep(1)
            # Note that the function call returns immediately, without waiting for the movement to complete.
            # The "ChannelState.REFERENCING" flag in the channel state can be monitored to determine
            # the end of the referencing sequence.
    
    def __enter__(self):
        return self
    def __exit__(self, *args):
        ctl.Close(self.d_handle)
        
if __name__=="__main__":
    stage=smaractmcs2()
    for i in range(10):
        # abs moving mode, move the stage to desired position 
        p=stage.position()
        p[0]+=100
        stage.move(p)
        time.sleep(0.2)