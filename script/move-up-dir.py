import os
import subprocess

# def visit(path):
#   def inner(path):
#     pass
#
#   if os.path.isdir(path):
#         for it in os.listdir(path):
#             inner(os.path.join(path, it), os.path.join(path, it))
#
#
# path = "."
#
#
# visit()

ignore = [
    "kemono",
    "compressed",
]

for current in os.listdir("."):
    if current in ignore or not os.path.isdir(current):
        continue

    dirs = list(map(lambda x: os.path.join(current, x), os.listdir(current)))

    for it in dirs:
        if os.path.isdir(it):
            d = list(map(lambda x: os.path.join(it, x), os.listdir(it)))
            # for it in d:
            subprocess.run(["mv", *d, current])

    # print(dirs)
    # subprocess.run([
    #   'mv',
    #   dirs,
    # ])
