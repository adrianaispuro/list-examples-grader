# Create your grading script here
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission

echo 'Finished cloning'

cd student-submission

if [[ -r "./ListExamples.java" ]]
    then
    echo "File found"
    cp ./ListExamples.java ../
    else
    echo "Missing file"
    echo "Grade: 0% - try again"
    exit 1
fi

javac -cp $CPATH *.java 2> compile-err.txt

if [[ $? -ne 0 ]]

    then
    echo "Compile error(s)!"
    if [[ $(wc -l < compile-err.txt) -gt 1 ]]
        then
            echo "Grade: 10% - too many compile errors"
        else
            echo "Grade: 20% - one compile error"
    fi
    cat compile-err.txt
    exit 1
    else
    echo "Compiled successfully"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-results.txt 2> test-err.txt

cat test-results.txt

cat test-err.txt


