# #!/bin/bash
#
# #------------------------------------------------------------------------------
# #  This shell script will call the MoLFI script for each datatset and return
# # the execution time using the "time" command then validate the generated templates
# #  to run this script, three arguments should be given:
# #       $1 = the MoLFI_tool.py script
# #       $2 = the validation.py script of related to MoLFI
# #       $3 = the output directory where to save the validation result (csv files)
# #       $4 = file with parameters for each dataset
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

pickle_file=$(mktemp)
# get the parameters from each log file
  while read -r line
  do

    logfile=$(awk -F"##" '{print $1}' <<< "$line" )
    echo "$logfile"
    # get the logfile name
    logname=$(basename $logfile)
    echo "${logname%.*}"

    oracle=$(awk -F"##" '{print $2}' <<< "$line")
    echo "$oracle"
    column_number=$(awk -F"##" '{print $3}' <<< "$line")
    echo "$column_number"
    separator=$(awk -F"##" '{print $4}' <<< "$line")
    echo $separator
    list=$(echo "$line" | awk -F"##"  '{print $5}')
    arr=(`echo "${list}"`)
    echo "${arr[@]}"

    #run MoLFI 50 times and save the execution time
    for number in {1..1}
    do
      # call MoLFI for each dataset
      echo $number
      exec_time=$({ /usr/bin/time python3.6 $1 -l $logfile -c $column_number -s $separator -r "${arr[@]}" -p "$pickle_file" >/dev/null; } 2>&1 | awk '{print $1 }')
      echo "$exec_time"
      # validate the generated templates
      python3.6 $2 -c $pickle_file -t $exec_time -o $oracle -s $3/Metrics/"${logname%.*}""_Metrics.csv" -to $3/Validation/"${logname%.*}""_Validation.txt" -r $number
      #
    done
  done < $4
rm $pickle_file
