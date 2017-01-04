#!/bin/bash


if [ -z $1 ]; then
	toggle_save='max'
else
	toggle_save=$1
fi


echo "Option: $toggle_save"

for i in 0 1 2 3 4 5 6 7
do
   cpu="/sys/devices/system/cpu/cpu$i"

   min_freq=$(cat "$cpu/cpufreq/cpuinfo_min_freq")
   max_freq=$(cat "$cpu/cpufreq/cpuinfo_max_freq")
   

   echo "CPU: $cpu MinFreq: $min_freq MaxFreq: $max_freq"

   curr_freq=$(cat $cpu/cpufreq/scaling_max_freq)
   echo "Current Scaling $cpu: $curr_freq"

   if [ $toggle_save == 'save' ] ; then
   	echo "Saving battery by underclocking processor cpu$i"
   	sudo echo $min_freq > $cpu/cpufreq/scaling_max_freq
   else
   	echo "Setting processor clock to normal maximum cpu$i"
   	sudo echo $max_freq > $cpu/cpufreq/scaling_max_freq
   fi


   
done
