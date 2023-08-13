#!/usr/bin/env python3

# Copyright 2020, 2021, 2023 Carles Pina i Estany <carles@pina.cat>
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
import glob
import os
import subprocess
import sys


def print_buffered_reader(buffered_reader):
    number_of_lines = 0
    for line in buffered_reader.readlines():
        line = line.decode('utf-8').rstrip()
        print(line)
        number_of_lines += 1

    return number_of_lines


def validate_file(dtd_path, file_path, *, verbose):
    xmllint_bin = 'xmllint'
    try:
        proc = subprocess.Popen([xmllint_bin, '--noout', '--dtdvalid', dtd_path, file_path],
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except FileNotFoundError:
        print(
            f'{xmllint_bin} needs to be available in the path. In Debian based systems is available in the package "libxml2-utils"', sys.stderr)
        sys.exit(2)
    if verbose:
        print_buffered_reader(proc.stdout)
        print_buffered_reader(proc.stderr)

    proc.communicate()

    return proc.returncode == 0


def validate_directory(dtd_path, directory_path):
    total_files = 0
    invalid_files = 0

    files = glob.glob(os.path.join(directory_path, '*'))
    files.sort()

    for file_path in files:
        valid = validate_file(dtd_path, file_path, verbose=False)

        print(f'{file_path} valid {valid}')

        total_files += 1

        invalid_files += 1 if not valid else 0

    print('Total files:', total_files)
    print('Invalid files:', invalid_files)


def validate(dtd_path, path):
    if not os.path.isfile(dtd_path):
        print(f'Make sure that {dtd_path} is a DTD file')
        sys.exit(1)

    if os.path.isfile(path):
        valid = validate_file(dtd_path, path, verbose=True)
        print('File is valid:', valid)
    elif os.path.isdir(path):
        validate_directory(dtd_path, path)
    else:
        print(f'Make sure that {path} is a file or directory')
        sys.exit(2)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Validates a file or a directory using the DTD')

    parser.add_argument('dtd_file', help='DTD file to validate against it')
    parser.add_argument('path', help='File or directory to validate')

    args = parser.parse_args()

    validate(args.dtd_file, args.path)
