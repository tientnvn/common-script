MYPATH=$1
OUTPUT_DIRECTORY=$2

if [ ! -d "$OUTPUT_DIRECTORY" ]; then
  mkdir $OUTPUT_DIRECTORY
fi

OUTPUT_DIRECTORY_2=$2_cate

START_CATE_ID=1000
START_ID=100000

if [ ! -d "$OUTPUT_DIRECTORY_2" ]; then
  mkdir $OUTPUT_DIRECTORY_2
fi

CATE_ID=$START_CATE_ID
ID=$START_ID

numbers=($(ls -d $MYPATH/*))
for (( i=0; i<${#numbers[@]}; i++ ));
do
  parent=($(ls -d -1 ${numbers[i]}/*))
  # echo $parent
  category=$(basename ${numbers[i]})
  # echo $category
  foldername=$category.txt
  echo $foldername
  for (( j=0; j<${#parent[@]}; j++ ));
  do
    echo ${parent[j]};
    file=$(basename ${parent[j]});
    filename=$file.txt
    echo $filename
    echo $file
    CATE_ID=$(expr $CATE_ID \+ 1)
    PHAN=$(expr $j \+ 1 )
    echo $file >> $OUTPUT_DIRECTORY_2/$foldername
    echo "Tập $PHAN" >> $OUTPUT_DIRECTORY_2/$foldername
    echo "" >> $OUTPUT_DIRECTORY_2/$foldername
    echo "-1" >> $OUTPUT_DIRECTORY_2/$foldername
    echo "$CATE_ID" >> $OUTPUT_DIRECTORY_2/$foldername
    echo "" >> $OUTPUT_DIRECTORY_2/$foldername

    lines=($(ls -d -1 ${parent[j]}/*))
    for(( k=0; k<${#lines[@]}; k++));
    do
      line=${lines[k]}
      name=$(basename $line ".mp3")
      ID=$(expr $ID \+ 1)
      # echo $name
      TAP=$(expr $k \+ 1 )
      echo $line >> $OUTPUT_DIRECTORY/$filename
      echo "Tập $TAP" >> $OUTPUT_DIRECTORY/$filename
      echo "" >> $OUTPUT_DIRECTORY/$filename
      echo "$CATE_ID" >> $OUTPUT_DIRECTORY/$filename
      echo "$ID" >> $OUTPUT_DIRECTORY/$filename
      echo "" >> $OUTPUT_DIRECTORY/$filename
    done
  done
done
