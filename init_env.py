#!/usr/bin/env python
from sys import exit
from os import remove
from os.path import abspath, exists, join, expanduser
from shutil import copy, copytree, rmtree

root_path = '~/{}'
dot_files = ['.vimrc',]
dot_dirs = ['.vim']


def askok(prompt, retries=3, complaint=' (y/n)? '):
    while True:
        ok = raw_input(prompt + complaint)
        if ok in ('Y', 'y', 'yes',  'Yes' 'J', 'j', 'ja'):
            return True
        if ok in ('N', 'n', 'No', 'no', 'nein'):
            return False
        retries = retries - 1
        if retries <= 0:
            raise IOError, 'refusenik user'


def _cp(rmfunc, cpfunc, base, file):
    fp = join(base, file)
    dotfile = expanduser(root_path.format(file))
    if exists(dotfile):
        try:
            if askok('{} exists! override?'.format(dotfile)):
                print(' rm :{}'.format(dotfile))
                rmfunc(dotfile)
            else:
                raise
        except:
            print('backup your files.')
            exit(-1)
    print(' {} -> {}'.format(fp, dotfile))
    cpfunc(fp, dotfile)


def inenv():
    base = abspath('.')
    for filename in dot_files:
        _cp(remove, copy, base, filename)
    for dirname in dot_dirs:
        _cp(rmtree, copytree, base, dirname)


if __name__ == '__main__':
    inenv()
