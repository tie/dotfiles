#!/bin/python
def disableHistoryFile():
  import sys
  if hasattr(sys, '__interactivehook__'):
    interactivehook = sys.__interactivehook__

    def newhook():
      import readline, atexit
      interactivehook()
      atexit.unregister(readline.write_history_file)

    sys.__interactivehook__ = newhook

disableHistoryFile()
del disableHistoryFile
