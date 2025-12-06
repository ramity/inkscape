import os
from PIL import Image

# This script combines the png files present in the /data directory and creates a gif file

def combine_images_to_gif(image_folder, output_file):
    images = []
    for file_name in sorted(os.listdir(image_folder)):
        if file_name.endswith('.png'):
            file_path = os.path.join(image_folder, file_name)
            images.append(Image.open(file_path))
    images[0].save(output_file, save_all=True, append_images=images[1:], loop=0, duration=100)

if __name__ == "__main__":
    combine_images_to_gif('/data', 'output.gif')
