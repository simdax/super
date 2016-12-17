"Fonctions pour OSC communication"

def init(adr, args):
    # print(volume)
    exec(open(YA+"/pyProx.py").read())

def init2(adr, args):
    global g
    # print(volume)
    exec(open(YA+"/init.py").read())

# def update(pos, adj, lines, symbols):
#     g.setData()
#     #    g.setData(pos=pos, adj=adj, pen=lines, size=1, symbol=symbols, pxMode=False)

def testBourrin(adr, args):
    import numpy as np
    global g
    print("VAZIIIII")
    ## Define positions of nodes
    pos = np.array([
        [0,0],
        [10,0],
        [0,10],
        [10,10],
        [5,5],
        [15,5]
    ])
    ## Define the set of connections in the graph
    adj = np.array([
        [0,1],
        [1,3],
        [3,2],
        [2,0],
        [1,5],
        [3,5],
    ])
    ## Define the symbol to use for each node (this is optional)
    symbols = ['o','o','o','o','o','o']
    ## Define the line style for each connection (this is optional)
    lines = np.array([
        (255,0,0,255,1),
        (255,0,255,255,2),
        (255,0,255,255,3),
        (255,255,0,255,2),
        (255,0,0,255,1),
        (255,255,255,255,4),
    ], dtype=[('red',np.ubyte),('green',np.ubyte),('blue',np.ubyte),('alpha',np.ubyte),('width',float)])
    ## Update the graph
    g.setData(pos=pos, adj=adj, pen=lines, size=1, symbol=symbols, pxMode=False)
