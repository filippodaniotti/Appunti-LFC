import os
import sys
import glob
import shutil

# List of files to be deleted according to name
names = [
    '_minted*',
    '*.aux',
    '*.dvi',
    '*.fdb_latexmk',
    '*.fls',
    '*.log',
    '*.out',
    '*.sta',
    '*.toc'
]

# Use flag -a for complete cleanup
if len(sys.argv) > 1 and str(sys.argv[1]) == '-a':
    names.append('*.pdf')
    names.append('*.synctex.gz')

items = list()
for name in names:
    items = glob.glob('./src/**/' + name, recursive = True)
    # If at least one 'name' element has been found
    if items:
        print('Checking ' + name)
        for item in items:
            print('>  Found ' + item)
            # If item is a _minted* folder
            if names.index(name) == 0:
                try:
                    shutil.rmtree(item)
                except OSError as err:
                    print("Error: %s : %s" % (item, err.strerror))
            else:
                try:
                    os.unlink(item)
                except OSError as err:
                    print("Error: %s : %s" % (item, err.strerror))

print('Working directory is clean')