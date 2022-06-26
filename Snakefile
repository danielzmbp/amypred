from Bio import SeqIO
import pandas as pd

samples, = glob_wildcards("samples/{sample}.faa")

localrules: seqlength, amylogram, appnn, tango, merge

rule all:
    input:
        expand("results/{sample}.csv", sample=samples)

rule seqlength:
    input:
        "samples/{sample}.faa"
    output:
        temp("results/{sample}_length.csv")
    run:
        s = []
        n = []
        for i in SeqIO.parse(input[0],"fasta"):
            s.append(len(i.seq))
            n.append(i.id)
        df = pd.DataFrame({'name':n,'length':s})
        df.to_csv(output[0],index=False)

rule amylogram:
    input:
        "samples/{sample}.faa"
    output:
        temp("results/{sample}_amylogram.csv")
    threads: 6
    script:
        "scripts/amylogram.R"

rule appnn:
    input:
        "samples/{sample}.faa"
    output:
       temp("results/{sample}_appnn.csv")
    conda:
        "envs/appnn.yaml"
    script:
        "scripts/appnn.R"

rule tango:
    input:
        "samples/{sample}.faa"
    output:
        temp("results/{sample}_tango.csv")
    script:
        "scripts/tango.py"
rule merge:
    input:
        amylogram= "results/{sample}_amylogram.csv",
        appnn= "results/{sample}_appnn.csv",
        tango= "results/{sample}_tango.csv",
        length= "results/{sample}_length.csv",

    output:
        out = "results/{sample}.csv"
    run:
        s = []
        def read_fasta(csv):
            s.append(pd.read_csv(str(csv), index_col=False))

        for att,value in input.items():
            read_fasta(value)

        pd.concat(s,axis=1).set_index("name").to_csv(output.out)
