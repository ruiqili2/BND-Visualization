import os
import subprocess
import sys

# get pwd
p = subprocess.Popen(['pwd'], stdout = subprocess.PIPE)

out, err = p.communicate()

pwd = out[:-1]
print pwd
cmd = "R -e \"shiny::runApp('{pwd}')\"".format(pwd = pwd)
print cmd
os.system(cmd)

