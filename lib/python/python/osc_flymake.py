# import random
# import argparse
# import math

import os




#exec(open(os.path.normalize("./funcs.py").read()))

from pythonosc import udp_client
from pythonosc import dispatcher
from pythonosc import osc_server

client = udp_client.SimpleUDPClient("localhost", 57120)

# for x in range(10):
#     client.send_message("/filter", random.random())
#     time.sleep(1)

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/test", print)
dispatcher.map("/init", init)
# dispatcher.map("/volume", print_volume_handler, "Volume")
# dispatcher.map("/logvolume", print_compute_handler, "Log volume", math.log)

server = osc_server.ThreadingOSCUDPServer(
    ("localhost", 8000), dispatcher)
print("Serving on {}".format(server.server_address))
server.serve_forever()
