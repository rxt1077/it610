import os

OUTPUT_DIR = "output"

# go through all subdirectories, find *.typ, and compile them
for root, dirs, files in os.walk("."):
    for file in files:
        if file.endswith(".typ"):
            infile = os.path.join(root, file)
            no_ext = os.path.basename(file).split('.')[0]
            if len(root[2:]) != 0:
                outfile = f"{OUTPUT_DIR}/{root[2:]}/{no_ext}.pdf"
            else:
                outfile = f"{OUTPUT_DIR}/{no_ext}.pdf"
            print(f"Compiling {infile} to {outfile}...")
            os.system(f"typst compile {infile} {outfile}")
