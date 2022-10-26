#!/usr/bin/env python3
import os
import sys

usage = """
usage:
    {} <package>

This will bump all the packages dependent on it.
""".format(sys.argv[0].split('/')[-1])

try:
    if sys.argv[1] in ["help","--help","-h"]:
        print(usage)
        exit(1)
    DEP = sys.argv[1]
except Exception:
    print(usage)
    exit(1)

folders = ["packages","x11-packages","root-packages"]

build_files = []

for i in folders:
    for folder in os.listdir(i):
        for line in open(i+"/"+folder+"/build.sh","r").read().split("\n"):
            if line.startswith("TERMUX_PKG_DEPENDS") or line.startswith("TERMUX_PKG_BUILD_DEPENDS"):
                if DEP in line:
                    build_files.append(i+"/"+folder+"/build.sh")


def bump_revision(file:str) -> None:
    """ 
    Bumps version in file
    """
    file_read = open(file,"r").read()
    revision = 0
    data = ""

    if "TERMUX_PKG_REVISION" in file_read:
        for line in file_read.split("\n"):
            if line.startswith("TERMUX_PKG_REVISION"):
                revision = int(line.split("=")[-1])+1
                data = file_read.split("\n")
                data[data.index(line)] = line.split("=")[0]+"="+str(revision)
                open(file,"w").write("\n".join(data))
                print("{} -> {} {}".format(revision-1,revision,file))
    else:
        for line in file_read.split("\n"):
            if line.startswith("TERMUX_PKG_VERSION"):
                data = file_read.split("\n")
                data.insert(data.index(line)+1,"TERMUX_PKG_REVISION=1")
                open(file,"w").write("\n".join(data))
                print("0 -> 1 "+file)



print("Bumping total {} packages".format(len(build_files)),end="\n\n")
for file in build_files:
    bump_revision(file)
