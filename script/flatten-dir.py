import os, subprocess
import sys
import natsort
import helper
import argparse

dirs = os.listdir(".")
SCRIPT_DIRECTORY = os.path.dirname(os.path.realpath(__file__))

parser =argparse.ArgumentParser(prog ="Flatten Directory")
parser.add_argument("--hardlink",action="store_true")
parser.add_argument("--move",action="store_true")
parser.add_argument("--softlink",action="store_true")

argv = parser.parse_args()


HARDLINK = argv.hardlink
MOVE = argv.move
before = os.getcwd()
for it in natsort.natsorted(dirs):
  if not os.path.isdir(it):
    continue
  os.chdir(it)

  mtime = helper.mtime.get_mtime('.')

  hardlink = ["--hardlink"] if HARDLINK else []
  move = ["--move"] if MOVE else []
  subprocess.run([
    'python',f'{SCRIPT_DIRECTORY}/flat-dir.py', '.', 
  ] + hardlink)

  helper.mtime.touch_mtime('.', mtime)

  os.chdir(before)

