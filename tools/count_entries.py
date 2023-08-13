#!/usr/bin/python3

# Copyright 2023 Carles Pina i Estany <carles@pina.cat>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the “Software”),
# to deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
