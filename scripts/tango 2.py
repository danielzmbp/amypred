import subprocess
import pandas as pd
from Bio import SeqIO
import os
import re

r = []

for seq in SeqIO.parse(snakemake.input[0], "fasta"):
    if "X" not in seq.seq:
        p = subprocess.Popen(["./scripts/tango2_3_1", seq.id, 
            "ct=N", "nt=N", "ph=7", "te=298", "io=0.05", "seq="+str(seq.seq)],
                        stdout=subprocess.PIPE)
        ps = p.communicate()
        tango = str(ps).split("\\n")[-2]
        r.append([seq.id, re.sub("[A-Z]", "", tango)])
    else:
        r.append([seq.id, " NA NA NA NA NA NA"])

df = pd.DataFrame(r)
dfs = df[1].str.strip().str.split(r"\s+", expand=True)
df = pd.concat([df[0], dfs], axis=1)

columns = ["name", "agg", "amylo", "turn", "helix", "helagg", "beta"]
df.columns = columns
df = df.iloc[:, 1:]
df.to_csv(snakemake.output[0], index=False)

for file in os.listdir():
    if file.endswith((".txt",".csv")):
        os.remove(file)
