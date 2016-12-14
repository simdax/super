"Fonctions pour OSC communication"

def init(adr, args):
    # print(volume)
    exec(open(YA+"/pyProx.py").read())

def update(pos, adj, lines, symbols):
    g.setData(pos=pos, adj=adj, pen=lines, size=1, symbol=symbols, pxMode=False)

