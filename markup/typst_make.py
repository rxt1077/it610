import os
import glob

OUTPUT_DIR = "../docs"

def compile(infile, outfile):
    print(f"Compiling {infile} to {outfile}...")
    os.system(f"typst compile {infile} {outfile}")

# build the syllabus
compile("syllabus.typ", OUTPUT_DIR + "/syllabus.pdf")

# build the slides
for infile in glob.glob("slides/*.typ"):
    compile(infile, OUTPUT_DIR + "/slides/" + os.path.basename(infile).split('.')[0] + ".pdf")

# build the exercises
for infile in glob.glob("exercises/*.typ"):
    compile(infile, OUTPUT_DIR + "/exercises/" + os.path.basename(infile).split('.')[0] + ".pdf")
