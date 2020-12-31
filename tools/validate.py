#!/usr/bin/env python3

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

    print('Number of lines:', number_of_lines)
    return number_of_lines


def validate_file(dtd_path, file_path):
    with subprocess.Popen(['xmllint', '--noout', '--dtdvalid', dtd_path, file_path],
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE) as proc:
        print_buffered_reader(proc.stdout)
        print_buffered_reader(proc.stderr)
        proc.communicate()
        print('Return Code:', proc.returncode)

        return proc.returncode == 0

def validate_directory(dtd_path, directory_path):
    for file_path in glob.glob(os.path.join(directory_path, '*')):
        validate_file(dtd_path, file_path)


def validate(dtd_path, path):
    if not os.path.isfile(dtd_path):
        print(f'Make sure that {dtd_path} is a DTD file')
        sys.exit(1)

    if os.path.isfile(path):
        validate_file(dtd_path, path)
    elif os.path.isdir(dtd_path, path):
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