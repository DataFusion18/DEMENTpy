#!/bin/bash

# Make changes to dementpy.sh using for loops
for scenario in bas mid sev
do

  #input output folder
  folder="input_$scenario output"
  sed -i -e "s/input_.*.output/$folder/" dementpy.sh

  for count in 1 2 3 4
  do

    jobname="dm_$scenario$count"
    sed -i -e "s/dm_.*/$jobname/" dementpy.sh

    outname="20191126$count"_"$scenario"
    echo "job name:" $outname
    sed -i -e "s/20191126.*/$outname/" dementpy.sh
    
    # submit to HPC
    qsub dementpy.sh

  done
done

# restore the dementpy.sh to where it has begin
jobname="dm_"
sed -i -e "s/dm_.*/$jobname/" dementpy.sh

folder="input_ output"
sed -i -e "s/input_.*.output/$folder/" dementpy.sh

outname="20191126"
sed -i -e "s/20191126.*/$outname/" dementpy.sh
