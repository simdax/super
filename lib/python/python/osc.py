# import random
# import argparse
# import math

## just setup
import inspect
import os
YA = os.path.dirname(inspect.getfile(inspect.currentframe()))
exec(open("/home/simdax/.local/share/SuperCollider/Extensions/super/lib/python/python/funcs.py").read())


## real puissance
from pythonosc import udp_client
from pythonosc import dispatcher
from pythonosc import osc_server


global g

client = udp_client.SimpleUDPClient("localhost", 57120)

# for x in range(10):
#     client.send_message("/filter", random.random())
#     time.sleep(1)

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/test", print)
dispatcher.map("/init", init)
dispatcher.map("/init2", init2)
dispatcher.map("/testBourrin", testBourrin)
# dispatcher.map("/volume", print_volume_handler, "Volume")
# dispatcher.map("/logvolume", print_compute_handler, "Log volume", math.log)

server = osc_server.ThreadingOSCUDPServer(
    ("localhost", 8000), dispatcher)
print("Serving on {}".format(server.server_address))
server.serve_forever()
