import sys, os

_, *head, tail = sys.argv

print(head)
print(tail)

for it in head:
    src = os.path.realpath(it)
    dst = os.path.realpath(os.path.join(tail, it))

    print({src, dst})
    if not os.path.exists(dst):
        os.symlink(src, dst, True)
