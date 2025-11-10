import os

for parent in os.listdir("."):
    parentfull = os.path.join(".", parent)
    if os.path.isfile(parentfull):
        continue
    for it in os.listdir(parentfull):
        if it.endswith(".png"):
            filename = os.path.splitext(it)[0]
            jpgpath = os.path.join(parentfull, filename + ".jpg")
            if os.path.exists(jpgpath):
                os.remove(jpgpath)


    

