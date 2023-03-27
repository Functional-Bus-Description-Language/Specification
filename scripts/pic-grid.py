"""
Scirpt for grid generation for pic.

Usage: pic-grid.py points-count resolution output-file

"""
import sys

if len(sys.argv) != 4:
    print(f"Invalid number of arguments {len(sys.argv)-1}, expecting 3 arguments")
    exit(1)

points_count = int(sys.argv[1])
resolution = float(sys.argv[2])
file_ = sys.argv[3]

f = open(file_, "w")

start_idx = -(points_count / 2)
start_point = -(points_count) / 2 * resolution

for p in range(points_count):
    idx = start_idx + p
    point = start_point + p * resolution

    if idx < 0:
        idx = f"m{int(abs(idx))}"
    else:
        idx = f"{int(idx)}"

    x = f"x{idx} = {point:.1f}\n"
    f.write(x)
    y = f"y{idx} = {point:.1f}\n"
    f.write(y)

f.close()
