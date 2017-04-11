#!/usr/bin/env cwl-runner

class: CommandLineTool

description: |
  Usage: sort [OPTION]... [FILE]...
    or:  sort [OPTION]... --files0-from=F
  Write sorted concatenation of all FILE(s) to standard output.

cwlVersion: v1.0 

dct:contributor:
  "@id": "http://orcid.org/orcid.org/0000-0002-6130-1021"
  foaf:name: Denis Yuen
  foaf:mbox: "mailto:help@cancercollaboratory.org"

dct:creator:
  "@id": "http://orcid.org/0000-0001-9102-5681"
  foaf:name: "Andrey Kartashov"
  foaf:mbox: "mailto:Andrey.Kartashov@cchmc.org"

dct:description: "Developed at Cincinnati Children’s Hospital Medical Center for the CWL consortium http://commonwl.org/ Original URL: https://github.com/common-workflow-language/workflows"

requirements:
  - class: DockerRequirement
    dockerPull: 312767926603.dkr.ecr.us-east-1.amazonaws.com/amazon-ecs-sample:latest

inputs:
  input:
    type:
      type: array
      items: File
    inputBinding:
      position: 4
  
  output:
    type: string

  key:
    type: 
      type: array
      items: string 
      inputBinding:
        prefix: "-k"
    inputBinding:
      position: 1
    description: |
      -k, --key=POS1[,POS2]
      start a key at POS1, end it at POS2 (origin 1)

stdout: $(inputs.output)

outputs:
  sorted:
    type: File
    description: "The sorted file"
    outputBinding: 
      glob: $(inputs.output)

baseCommand: ["sort"]

