import os
import sys
import argparse

parser =argparse.ArgumentParser(prog ="Flatten Directory")
parser.add_argument("path")
parser.add_argument("--hardlink",action="store_true")
parser.add_argument("--move",action="store_true")
parser.add_argument("--softlink",action="store_true")

test = parser.parse_args()

HARDLINK = test.hardlink
MOVE = test.move


def visit(path):
    def inner(path, parent):
        if os.path.isdir(path):
            for it in os.listdir(path):
                cur = os.path.join(path, it)

                into = parent + "／" +  it

                inner(cur, into)

                if os.path.isfile(into) and os.path.exists(into):
                    os.remove(into)
                if os.path.isfile(cur) and not os.path.exists(into):
                    if HARDLINK:
                        os.link(cur, into)
                    elif MOVE:
                        os.replace(cur, into)
                    else:
                        os.symlink(cur, into)
                # os.rename(cur, os.path.join(parent, into))
        
    if os.path.isdir(path):
        for it in os.listdir(path):
            inner(os.path.join(path, it), os.path.join(path, it))



path = sys.argv[1] or "."

visit(path)


# dir = os.listdir(path)
# for parent in os.listdir("."):
#     if os.path.isdir(parent):
#         cur = os.path.join(".", parent)
#
#         for it in os.listdir(cur):
#             if it.startswith(parent + "_"):
#                 filename = it.removeprefix(parent + "_")
#
#                 src = os.path.join(parent, it)
#                 dst = os.path.join(parent, filename)
#                 os.rename(src, dst )
#
#         # print(f"mv \"{cur}_\"* \"{cur}\";")
