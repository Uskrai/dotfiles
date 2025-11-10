import subprocess
import typing
import json
import sys

swaymsg = subprocess.run(['swaymsg', '-t', 'get_workspaces'], stdout=subprocess.PIPE)
all_workspaces = json.loads(swaymsg.stdout)

def get_visibles(workspaces: list[dict]):
    w: list[dict] = []
    for workspace in workspaces:
        if workspace.get('visible') == True:
            w.append(workspace)

    return w

def get_focused_index(workspaces: list[dict]):
    for index, workspace in enumerate(workspaces):
        if workspace.get("focused") == True:
            return index

def get_focused_step(workspaces: list[dict], step: int):
    focused = get_focused_index(workspaces)

    length = len(workspaces)

    after = focused + step
    return workspaces[after % length]

def get_focused(workspaces: list[dict]):
    index = get_focused_index(workspaces)

    return workspaces[index]

def pretty_print(a):
    print(json.dumps(a, indent=2))



workspaces = all_workspaces

direction = sys.argv[1].lower()
step = 0

if direction in ['up', 'down']:
    workspaces = get_visibles(workspaces)

if direction in ['up', 'right']:
    step = 1
if direction in ['down', 'left']:
    step = -1


target = get_focused_step(workspaces, step)

subprocess.run(['swaymsg', 'workspace', 'number', str(target['num'])])

# visible = get_visibles(all_workspaces)


