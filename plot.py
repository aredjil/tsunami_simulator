#! /usr/bin/env python3 
import numpy as np 
import matplotlib.pyplot as plt 
from pathlib import Path 



def main():
    output_path = Path(__file__).resolve().parent / "output.txt"
    # Ouputpath for the figures 
    fig_path = Path(__file__).resolve().parent / "figs"
    data = np.loadtxt(output_path, dtype=float)
    for i, datum in enumerate(data):
        plt.figure()
        plt.plot(datum[1:])
        plt.fill_between(range(len(datum[1:])), datum[1:], 0, color="lightblue")
        plt.title(f"Time step: {int(datum[0])}")
        plt.ylabel("Height")
        plt.xlim(0, 100)
        plt.ylim(0, )
        plt.savefig(fig_path /f"fig_{i}.png")
        plt.close()
        # plt.show()

if __name__ == "__main__":
    main()