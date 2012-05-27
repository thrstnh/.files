#!/usr/bin/env python
from __future__ import print_function
from os import chdir
from os.path import join, exists, expanduser
import commands
r'''
    author: thrstnh
    created: 2012-05-27
    make plugin handling easy.
'''

bundles_dir = expanduser('~/.vim/bundle')
git_bundles = [
        'https://github.com/fholgado/minibufexpl.vim',
        'https://github.com/vim-scripts/pep8',
        'https://github.com/fs111/pydoc.vim',
        'https://github.com/alfredodeza/pytest.vim',
        'https://github.com/tpope/vim-fugitive',
        'https://github.com/nathanaelkane/vim-indent-guides',
        'https://github.com/scrooloose/nerdtree',
        'https://github.com/mitechie/pyflakes-pathogen',
        'https://github.com/msanders/snipmate.vim',
        'https://github.com/tpope/vim-surround',
        'https://github.com/tpope/vim-git',
        'https://github.com/mjbrownie/pythoncomplete.vim',
        'https://github.com/vim-scripts/VimClojure',
        'https://github.com/scrooloose/nerdcommenter',
        'https://github.com/Raimondi/delimitMate',
        'https://github.com/ervandew/supertab',
        'https://github.com/vim-scripts/Pydiction',
        'https://github.com/vim-scripts/taglist.vim',
        'https://github.com/vim-scripts/TaskList.vim',
        'https://github.com/vim-scripts/PyChimp',
        'https://github.com/vim-scripts/Vimpy--Stoner']


def create_ctags():
    '''ctags -R -f python.ctags /usr/lib/python2.7
    #TODO
    '''
    pass


def _check(code, msg):
    r'''check return code '''
    if code != 0:
        raise AssertionError(':{}  :{}'.format(code, msg))
    print(':{}'.format(msg))
    return True


def update_bundles():
    r'''clone or update bundles '''
    for bundle in git_bundles:
        chdir(bundles_dir)
        name = bundle.split('/')[-1]
        bpath = join(bundles_dir, bundle.split('/')[-1])
        if exists(bpath):
            print(':pull updates  :{}'.format(name), end='  ')
            chdir(bpath)
            cmd = 'git pull'
            code, msg = commands.getstatusoutput(cmd)
            _check(code, msg)
        else:
            print(':clone  :{}'.format(name), end='  ')
            cmd = 'git clone {} {}'.format(bundle, bpath)
            code, msg = commands.getstatusoutput(cmd)
            _check(code, msg)
    print('done.')


if __name__ == '__main__':
    update_bundles()
