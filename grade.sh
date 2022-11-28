# Create your grading script here
CPATH=".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar"
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
    echo "Failed - try again"
    exit 1
fi

cd ..

javac -cp $CPATH *.java 2> compile-err.txt

if [[ $? -ne 0 ]]

    then
    echo "Compile error(s)!"
    if [[ `grep "errors" compile-err.txt` -ge 1 ]]
        then
            echo "Failed - too many compile errors"
        else
            echo "Failed - one compile error"
    fi
    cat compile-err.txt
    exit 1

    else
    echo "Compiled successfully"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-results.txt 2> test-err.txt

if [[ `grep "FAILURES" < test-results.txt` -ne 0 ]]
then
    echo "Failed - Test(s) failed"
    cat test-results.txt
    exit 1
else   
    echo "Passed - all tests run successfully"
    exit 0
fi

