#!/usr/bin/env python3
"""
Extract all the keyword commands and parameters for a syntax file for MrBayes
(generated by running the ``manual`` command in MrBayes)
"""
import sys
from itertools import zip_longest
import re
HR = "---------------------------------------------------------------------------"
commands, parameters, options = set(), set(), set()
option_regex = re.compile(r"([a-zA-Z]+)\((.+?)\)")

with open("commref_mb3.2.5.txt") as fobj:
    command_next = False
    for line in fobj:
        for key, value in option_regex.findall(line):
            if value != "s":
                options.add(key.lower())
        line = line.strip().split()
        try:
            if line[0] == HR:
                command_next = True
            else:
                if command_next:
                    if len(line) == 1:
                        if set(line[0]) != set(["*"]):
                            # print("command>", line[0], file=sys.stderr)
                            commands.add(line[0].lower())
                    command_next = False
            if line[1] == "--":
                # print("param>", line[0], file=sys.stderr)
                for keyword in line[0].split("/"):
                    parameters.add(keyword.lower())
        except IndexError:
            pass
    
vimsyntax = dict()
known = set()
with open("../syntax/nexus.vim") as fobj:
    for line in fobj:
        line = line.strip()
        if line.startswith("syn keyword"):
            row = line.split()
            vimsyntax.setdefault(row[2], set()).update(set(row[3:]))
            known.update(set(row[3:]))

# print(vimsyntax)
# for key in vimsyntax:
#     print(key)

print("--> Commands in syntax file, not parsed from manual", file=sys.stderr)
print("Commands:", vimsyntax["nexusCommand"] - commands, file=sys.stderr)
# print("--> Parsed from manual, not in syntax file", file=sys.stderr)
# print("Commands:", commands - known, file=sys.stderr)
print("--> Parameters in syntax file, not parsed from manual", file=sys.stderr)
print("Parameters:", vimsyntax["nexusParameter"] - parameters, file=sys.stderr)
# print("--> Parsed from manual, not in syntax file", file=sys.stderr)
# print("Parameters:", parameters - known, file=sys.stderr)

def grouper(iterable, n, fillvalue=None):
    "Collect data into fixed-length chunks or blocks"
    # grouper('ABCDEFG', 3, 'x') --> ABC DEF Gxx
    args = [iter(iterable)] * n
    return zip_longest(fillvalue=fillvalue, *args)

print("--> Items to add to nexus.vim syntax file")
print('" Further commands')
for command_group in grouper(sorted(commands - known), 3, ""):
    print("syn keyword\tnexusCommand\t{0} {1} {2}".format(*command_group))
print('" Further parameters')
for param_group in grouper(sorted(parameters - known), 3, ""):
    print("syn keyword\tnexusParameter\t{0} {1} {2}".format(*param_group))
print('" Further options')
for option_group in grouper(sorted(options - known), 3, ""):
    print("syn keyword\tnexusOptionsX\t{0} {1} {2}".format(*option_group))

