#!/bin/bash
#Create by Trustway.Super
#20140909
clear
rq=`date "+%F %X"`
echo "###Today is $rq###"
echo "###Picture PATH operations for CDT###"
select ch in "List all picture directory;" "Delete picture directory;" "HDFS health check;" "Exit."
do
case $ch in

"List all picture directory;")
        hadoop dfs -ls /hbase/blobstore/pic_hbase/p | cut -b 85- | sort | grep 20* | head -11
;;
"Delete picture directory;")
        read -p "Enter the file name to delete: " name
        read -p "Do you want to delete $name? [y/n]" a
                echo $a > /tmp/a.log
                if cat /tmp/a.log | grep y;then
                        sudo -u hdfs hadoop fs -rmr /hbase/blobstore/pic_hbase/p/$name
                else
                        echo "No file has been deleted.";
                fi
;;
"HDFS health check;")
        sudo -u hdfs hadoop dfsadmin -report | head -11
;;
"Exit.")
        echo "exit"
        break;
;;
*)
        echo "Error choice, retry please!"
;;
esac
done;