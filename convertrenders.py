try:
    from PIL import Image
except ImportError as e:
    print("Pillow is required to convert tga files to png. Run 'pip install --upgrade Pillow' and retry.")
    exit()

import os

directory = "renders"
for filename in os.listdir(directory):
    f = os.path.join(directory, filename)
    if os.path.isfile(f):
        path, ext = os.path.splitext(f)
        if ext == ".tga":
            im = Image.open(f)
            im.save(path + ".png")
            os.remove(f)