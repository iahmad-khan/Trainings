#bash topics

#for loop
for item in $items
do
  task $item
done

#one line for loop
for item in $items ; do task $item ; done
for a in $things; do; command_3 a; done

for animal in dog cat 'fruit bat' elephant ostrich
do
  echo "I want a $animal for a pet"
done

##Here's a more elaborate version using variables:

for thing in $collection_of_things
do
  some_program $thing
  another_program $thing >> data.txt
  # as many commands as we want
done
#A command substitution can be used to generate the items that the
#for loop iterates across:

for var_name in $(seq 1 100); do
  echo "Counting $var_name..."
done

#If you need to read a list of lines from a file, and are absolutely
#sure that none of the lines contain a space within them:

for url in $(cat list_of_urls.txt); do
  curl "$url" >> everywebpage_combined.html
done

#A read-while loop is a variation of the above,
#but is safer for reading lines from a file:

while read url
do
  curl "$url" >> everywebpage_combined.html
done < list_of_urls.txt

#using seq
for x in $(seq 1 10); do echo $x ; done

#using brance expansion
for x in ab{1..10} ; do echo $x ; done

#read a file with while is more safer
while read line
 do
   echo "$line"
done < list-of-dirs.tx

#read with cat and for loop , avoid using it
for line in $(cat list-of-dirs.txt)
do
  echo "$line"
done

#We can also pipe from the result of a command by enclosing it in <( and ):
while read line
 do
   echo "Word count per line: $line"
 done < <(cat list-of-dirs.txt | wc -w)

#pipes
echo "hello world i am here" | tr '[:lower:]' '[:upper:]' | tr ' ' '\n'

#produces the same output as
for word in hello world i am here; do
  echo $word | tr '[:lower:]' '[:upper:]'
done

# send the stream through a reverse filter
echo "hello world i am here" | rev

# filter out the first 2 characters
echo "hello world i am here" | cut -c 3-

# filter out the spaces
echo "hello world i am here" | tr -d ' '

# filter out words with less than 5 characters
echo "hello world i am here" | grep -oE '[a-z]{5,}'

#for more complex tasks use loops
while read url; do
   # download the page
   content=$(curl -Ls $url)
   # count the words
   num_of_words=$(echo $content | wc -w)
   # extract the title
   title=$(echo $content | grep -oP '(?<=<title>)[^<]+')
   # send an email with the page's title and word count
   echo "$content" | mail whoever@stanford.edu -s "$title: $num_of_words words"
   echo "...Sending: $title: $num_of_words words"
done < urls.txt

#piping into read while loops
echo 'hey you' | grep -oE '[a-z]+' | while read line;
  do
  echo word | wc -c
done >> sometxt

#scripting
#For the numbers 1 through 10, use curl to download the Wikipedia entry
#for each number, and save it to a file named "wiki-number-
#(whatever the number is).html"
#example entery: curl http://en.wikipedia.org/wiki/1 > 'wiki-number-1.html'
base_url=http://en.wikipedia.org/wiki
fname='wiki-number'
for x in $(seq 1 100)
do
  curl "$base_url/$x" > "wiki-number-$x"
  sleep 2
done












