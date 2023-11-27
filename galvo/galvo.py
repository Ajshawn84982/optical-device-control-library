# -*- coding: utf-8 -*-
"""
Created on Tue Oct 31 16:13:23 2023

@author: labuser
"""

import os
import numpy as np
from ctypes import *
class glavo:
    def __init__(self):
        
        self.working_card=c_uint16(1)
        # load the dll file
        cdll.LoadLibrary("galvo\\rtc4ethdllx64")
        self.galvo_lib = CDLL("rtc4ethdllx64")
        self.num_found_cards=c_uint16()
        
        # search for thr ethernet connection
        #num_found_cards is a reference parameter for rtc_search_cards function
        self.galvo_lib.rtc_search_cards(byref(self.num_found_cards),self.galvo_lib.convert_string_to_ip(c_wchar_p("0.0.0.0")),self.galvo_lib.convert_string_to_ip(c_wchar_p("255.255.255.0")));
        		
        # assign control card
        res=self.galvo_lib.assign_rtc(c_uint16(1), c_uint16(1))
        print(res)  # print card number if assign successfully
        
        # acquire control card
        res=self.galvo_lib.acquire_rtc(c_uint16(1));
        if res!=0:
            print("cannot acquire rtc card")
            self.galvo_lib.release_rtc(c_uint(1))
            
        # loading calibration file
        res = self.galvo_lib.n_load_program_file(c_uint16(1),b"RTC4D2.hex");
        if res!=0:
            print("cannot load program file")
            self.galvo_lib.release_rtc(c_uint(1))
            
        res = self.galvo_lib.n_load_correction_file(c_uint16(1),b"Cor_1to1.ctb", c_short(1), c_double(1), c_double(1), c_double(0), c_double(0), c_double(0));
        if res!=0:
            print("cannot load correction file")
            self.galvo_lib.release_rtc(c_uint(1))

    def jump_one_angle(self):
        # build a working list for galvo mirror and load the working list to working card 2
        self.galvo_lib.select_rtc(self.working_card);
        
        # set a start point of working list
        self.galvo_lib.n_set_start_list_2(self.working_card);
        
        self.galvo_lib.n_set_jump_speed(self.working_card, c_double(5000));
        
        # set the desired number of angle of galvo mirror
        angle_num = c_int64(-800);
        self.galvo_lib.n_jump_abs(self.working_card, s, s);
        self.galvo_lib.n_long_delay(self.working_card, c_short(20000));
        
        # define a end point of working list
        self.galvo_lib.n_set_end_of_list(self.working_card);
        self.galvo_lib.select_rtc(self.working_card);
        
    def waggle_two_angle(self):
        # build a working list for galvo mirror and load the working list to working card 2
        self.galvo_lib.select_rtc(self.working_card);
        
        # set a start point of working list
        self.galvo_lib.n_set_start_list_2(self.working_card);
        
        self.galvo_lib.n_set_jump_speed(self.working_card, c_double(5000));
        
        # set the desired number of angle of galvo mirror
        angle_num = c_int64(-800);
        angle_num1 = c_int64(0);
        for i in range(20):
            self.galvo_lib.n_jump_abs(self.working_card, angle_num, angle_num);
            self.galvo_lib.n_long_delay(self.working_card, c_short(20000));
            self.galvo_lib.n_jump_abs(self.working_card, angle_num1, angle_num1);
            self.galvo_lib.n_long_delay(self.working_card, c_short(20000));
        
        # define a end point of working list
        self.galvo_lib.n_set_end_of_list(self.working_card);
        self.galvo_lib.select_rtc(self.working_card);
    def execute(self):
        self.galvo_lib.n_execute_list_2(self.working_card);
    
    def __enter__(self):
        return self
    def __exit__(self, *args):
        self.galvo_lib.release_rtc(c_uint(1));


	

