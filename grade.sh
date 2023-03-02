CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then
    echo "files found"
else
    echo "Necessary files not found"
    exit 1
fi

cd ..
cp student-submission/ListExamples.java ./ 
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if [$? -ne 0]
then  
    echo "compilation failed"
    exit 1
fi

echo "compilation success"

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples



