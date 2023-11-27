"""
├── example.py
├── piezo/
│   ├── __init__.py
│   ├── piezo_lib.py
│   └── smaract/
│       └── ctl/
│           └──__init__.py   
│  
"""
from piezo import piezo_lib
import time
import tifffile
import numpy as np

with piezo_lib.smaractmcs2() as stage:
    p=stage.position()
    pinit=p*1
    p[0]-=750
    stage.move(p)
   
    
    for i in range(150):
        print(i)
        p=stage.position()
        p[0]+=10
        stage.move(p)
        time.sleep(0.2)

stage.move(pinit)
time.sleep(0.2)
time.sleep(1.0)
