"gros caca ?"

import inspect
import os

YA = os.path.dirname(inspect.getfile(inspect.currentframe()))

def init():
    "est censé charger un truc"
    exec(open(YA+"/init.py").read())

def update(pos, adj, lines, symbols):
    g.setData(pos=pos, adj=adj, pen=lines, size=1, symbol=symbols, pxMode=False)

