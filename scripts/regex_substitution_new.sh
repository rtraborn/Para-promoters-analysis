#!/usr/bin/sh

myDir=/home/rraborn/scratch/Para-promoters-analysis/paralog_datasets
sp_1=col_4.txt
sp_2=col_5.txt
sp_3=col_6.txt
sp_4=col_7.txt
sp_5=col_8.txt
sp_6=col_9.txt
sp_7=col_10.txt
sp_8=col_11.txt
sp_9=col_12.txt
sp_10=col_13.txt
sp_11=col_14.txt
sp_12=col_15.txt
sp_13=col_16.txt
sp_14=col_17.txt

cd $myDir

#TODO there are still remaining instances with ",", please fix

#sp_4
perl -pe 's/(\S+\.\S+\.\S+\.\S+)(\,)(\S+\.\S+\.\S+\.\S+)/\1\t\3/g' $sp_1 > tmp4
perl -pe 's/(\S+\.\S+\.\S+\.\S+)(\,)(\.)/\1\t\3/g' tmp4 > tmp4.1
perl -pe 's/(\.)(\,)(\S+\.\S+\.\S+\.\S+)/\1\t\3/g' tmp4.1 > tmp4.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp4.2 > tmp4.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp4.2 > tmp4.3

#sp_2 (P. dec)
perl -pe 's/(\w+\.\d+\.\d\.\S+)(\,)(\W+\.\d+\.\d\.\S+)/\1\t\3/g' $sp_2 > tmp5
perl -pe 's/(\.)(\,)(\w+\.\d+\.\d\.\S+)/\1\t\3/g' tmp5 > tmp5.1
perl -pe 's/(\w+\.\d+\.\d\.\S+)(\,)(\.)/\1\t\3/g' tmp5.1 > tmp5.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp5.2 > tmp5.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp5.3 > tmp5.4

#sp_3 (P. dodec)
perl -pe 's/(\w+\.\d+\.\d\.\S+)(\,)(\w+\.\d+\.\d\.\S+)/\1\t\3/g' $sp_3 > tmp6
perl -pe 's/(\.)(\,)(\w+\.\d+\.\d\.\S+)/\1\t\3/g' tmp6 > tmp6.1
perl -pe 's/(\w+\.\d+\.\d\.\S+)(\,)(\.)/\1\t\3/g' tmp6.1 > tmp6.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp6.2 > tmp6.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp6.3 > tmp6.4 

#sp_4 (P. jenn)
perl -pe 's/(\S+\.\w+\.\d+\.\S+)(\,)(\S+\.\w+\.\d+\.\S+)/\1\t\3/g' $sp_4 > tmp7
perl -pe 's/(\S+\.\d+\.\d+\.\S+)(\,)(\.)/\1\t\3/g' tmp7 > tmp7.1
perl -pe 's/(\.)(\,)(\S+\.\d+\.\d+\.\S+)/\1\t\3/g' tmp7.1 > tmp7.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp7.2 > tmp7.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp7.3 > tmp7.4 

#sp_5 (P. nov)
perl -pe 's/(\S+\.\w+\.\d+\.\S+)(\,)(\S+\.\w+\.\d+\.\S+)/\1\t\3/g' $sp_5 > tmp8
perl -pe 's/(\S+\.\d+\.\d+\.\S+)(\,)(\.)/\1\t\3/g' tmp8 > tmp8.1
perl -pe 's/(\.)(\,)(\S+\.\d+\.\d+\.\S+)/\1\t\3/g' tmp8.1 > tmp8.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp8.2 > tmp8.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp8.3 > tmp8.4 

#sp_6 (P. oct)
perl -pe 's/(\S+\.\S+\.\d+\.\S+)(\,)(\S+\.\S+\.\d+\.\S+)/\1\t\3/g' $sp_6 > tmp9
perl -pe 's/(\S+\.\S+\.\d+\.\S+)(\,)(\.)/\1\t\3/g' tmp9 > tmp9.1
perl -pe 's/(\.)(\,)(\S+\.\S+\.\d+\.\S+)/\1\t\3/g' tmp9.1 > tmp9.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp9.2 > tmp9.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp9.3 > tmp9.4 

#sp_7 (P. pent)
perl -pe 's/(\S+\.\S+\.\d+\.\S+)(\,)(\S+\.\S+\.\d+\.\S+)/\1\t\3/g' $sp_7 > tmp10
perl -pe 's/(\S+\.\S+\.\d+\.\S+)(\,)(\.)/\1\t\3/g' tmp10 > tmp10.1
perl -pe 's/(\.)(\,)(\S+\.\S+\.\d+\.\S+)/\1\t\3/g' tmp10.1 > tmp10.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp10.2 > tmp10.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp10.3 > tmp10.4 

#sp_8 (P. pprim) 
#now for the annoying PPRIM ids:
perl -pe 's/(PPRIMP\d+)(\,)(\.)/\1\t\3/g' $sp_8 > tmp11
perl -pe 's/(\.)(\,)(PPRIMP\d+)/\1\t\3/g' tmp11 > tmp11.1
perl -pe 's/(PPRIMP\d+)(\,)(PPRIMP\d+)/\1\t\3/g' tmp11.1 > tmp11.2
#echo "Made it here"
perl -pe 's/(PPRIMP\d+)(\,)(PPRIMP\d+)/\1\t\3/g' tmp11.2 > tmp11.3
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp11.3 > tmp11.4
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp11.4 > tmp11.5 

#sp_9 (P. quad)
perl -pe 's/(\S+\.\S+\.\d+\.\S+)(\,)(\S+\.\S+\.\d+\.\S+)/\1\t\3/g' $sp_9 > tmp12
perl -pe 's/(\S+\.\S+\.\d+\.\S+)(\,)(\.)/\1\t\3/g' tmp12 > tmp12.1
perl -pe 's/(\.)(\,)(\S+\.\S+\.\d+\.\S+)/\1\t\3/g' tmp12.1 > tmp12.2
perl -pe 's/(NA)(\,)(NA)/\1\t\3/g' tmp12.2 > tmp12.3
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp12.3 > tmp12.4 

echo "Job complete."
