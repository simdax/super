# -*- coding: utf-8 -*-

"balance un gros graphe dans ta gueule"

import pyqtgraph as pg
import numpy as np
from pyqtgraph.Qt import QtGui, QtCore

#pg.mkQApp()
# Enable antialiasing for prettier plots
# pg.setConfigOptions(antialias=True)
# w.setWindowTitle('pyqtgraph example: GraphItem')


# import pyqtgraph.multiprocess as mp

# proc = mp.QtProcess()
# rpg = proc._import('pyqtgraph')

QtGui.QApplication.instance().exec_()

#data = proc.transfer([])

# ??
w = pg.GraphicsWindow()
g= pg.GraphItem()
v = w.addViewBox()
# v.setAspectLocked()
# v.addItem(g)
# ## Define positions of nodes
# pos = np.array([
#     [0,0],
#     [10,0],
#     [0,10],
#     [10,10],
#     [5,5],
#     [15,5]
#     ])
    
# ## Define the set of connections in the graph
# adj = np.array([
#     [0,1],
#     [1,3],
#     [3,2],
#     [2,0],
#     [1,5],
#     [3,5],
#     ])
    
# ## Define the symbol to use for each node (this is optional)
# symbols = ['t','t','t','t','t','+']

# ## Define the line style for each connection (this is optional)
# lines = np.array([
#     (255,0,0,255,1),
#     (255,0,255,255,2),
#     (255,0,255,255,3),
#     (255,255,0,255,2),
#     (255,0,0,255,1),
#     (255,255,255,255,4),
#     ], dtype=[('red',np.ubyte),('green',np.ubyte),('blue',np.ubyte),('alpha',np.ubyte),('width',float)])

## Update the graph
#g.setData(pos=pos, adj=adj, pen=lines, size=1, symbol=symbols, pxMode=False)
