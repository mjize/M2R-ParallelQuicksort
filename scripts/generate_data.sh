
OUTPUT_DIRECTORY=../data/
mkdir -p $OUTPUT_DIRECTORY

for i in 10 100 1000 10000 100000 1000000; do
	OUTPUT_FILE=$OUTPUT_DIRECTORY/result$i.txt
	touch $OUTPUT_FILE
	echo "#,tamanho,threads,sequencial,paralelo,libc" >> $OUTPUT_FILE;
	for t in 1 2 4 8 16; do
	    for rep in `seq 1 30`; do		
		../src/parallelQuicksort $i $t $rep >> $OUTPUT_FILE;
	    done ;
	done ;
done
