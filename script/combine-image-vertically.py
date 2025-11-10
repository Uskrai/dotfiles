import os
import subprocess
import sys

import natsort

start = int(sys.argv[1]) - 1
stop = int(sys.argv[2]) - 1
step = int(sys.argv[3])


dirs = natsort.natsorted(os.listdir())


print(f"start: {dirs[start]}\nstop: {dirs[stop]}\nstep: {step}")

i = input("true [y]?")

if i != "y":
    exit()

os.makedirs('bk', exist_ok=True)

for e, it in enumerate(range(start, stop + 1, step)):
    e += start
    converting = []

    for j in range(it, min(it + step, stop + 1)):
        converting.append(dirs[j])

    subprocess.run([
        'mv',
        *converting,
        'bk'
    ])

    converting = list(map(lambda x: f'bk/{x}', converting))
    # print(dirs[e], *converting)

    run_cmd = [
        'convert',
        '+append',
        *converting,
        dirs[e]
    ]
    print(run_cmd)
    subprocess.run(run_cmd)


print("run")
