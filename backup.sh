!#/bin/bash
TIME=`date +%b-%d-%y`           
FILENAME=backup-$TIME.tar.gz   
SRCDIR=/imp-data                    
DESDIR=/mybackupfolder   
       
tar -cpzf $DESDIR/$FILENAME $SRCDIR 

if [ "$?" = "0" ]; then
        echo "Backup Process was Successful. A new backup file $FILENAME has been created" | mailx -s "Backup Status Successful" itsupport@gmail.com
else
         echo "Backup Process Failed. Please contact System Administrator" | mailx -s "Backup Status Failed" itsupport@gmail.com
        exit 1
fi

find /imp-data -mindepth 1 -mtime +1 -delete
