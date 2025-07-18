import imageio
from pathlib import Path

def main():
    image_folder = Path(__file__).resolve().parent /"figs"  
    images = sorted(image_folder.glob("fig_*.png"), key=lambda f: int(f.stem.split("_")[1]))

    # Read and save as GIF
    frames = [imageio.imread(img) for img in images]
    imageio.mimsave("animation.gif", frames, duration=0.2) 
if __name__ == "__main__":
    main()
