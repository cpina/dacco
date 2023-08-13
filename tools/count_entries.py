#!/usr/bin/python3

import argparse
from pathlib import Path
import xml.etree.ElementTree as ET

def count_entries_file(file: Path) -> int:
    tree = ET.parse(file)

    count = 0

    for element in tree.findall(".//Entry"):
        count += 1

    return count

def count_entries_directory(directory: Path):
    total = 0

    for file in sorted(directory.iterdir()):
        entries = count_entries_file(file)
        print(f"{file}: {entries}")
        total += entries

    print()
    print("Total number of entries:", total)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Count entries of DACCO')

    parser.add_argument('path', help='Directory to count the entries. Open each *.dic file and count')

    args = parser.parse_args()

    count_entries_directory(Path(args.path))
