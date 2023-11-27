# -*- coding: utf-8 -*-
"""
Created on Mon Nov 27 16:01:31 2023

@author: localadmin
"""

from galvo import galvo

# initial galvo mirror and build device connection
g=galvo.galvo()
#build working list
g.waggle_two_angle()
#run the working list
g.execute()
