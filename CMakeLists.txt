cmake_minimum_required(VERSION 3.0.0)
set(CMAKE_CXX_COMPILER /usr/bin/g++)
project(aesd-assignments)

set(AUTOTEST_SOURCES
    test/assignment1/Test_hello.c
    test/assignment1/Test_assignment_validate.c
    ../student-test/assignment1/Test_validate_username.c
)

