MYPATH=$1
OUTPUT_DIRECTORY=$2

if [ ! -d "$OUTPUT_DIRECTORY" ]; then
  mkdir $OUTPUT_DIRECTORY
fi


numbers=($(ls -d $MYPATH/*))
for (( i=0; i<${#numbers[@]}; i++ ));
do
  parent=($(ls -d -1 ${numbers[i]}/*))
  # echo $parent
  category=$(basename ${numbers[i]})
  echo $category
  filename=$category.txt
  for (( j=0; j<${#parent[@]}; j++ ));
  do
    # echo ${parent[j]};
    file=$(basename ${parent[j]});
    echo $file
    TAP=`expr $j + 1`
    echo $file >> $OUTPUT_DIRECTORY/$filename
    echo "Tập $TAP" >> $OUTPUT_DIRECTORY/$filename
    echo "" >> $OUTPUT_DIRECTORY/$filename
    echo "" >> $OUTPUT_DIRECTORY/$filename
  done
done
