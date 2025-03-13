cmake_minimum_required(VERSION 3.0.0)
project(assignment-autotest)

# Include unity testing
add_subdirectory(Unity)
include_directories(Unity/src . ..)

# Explicitly define test files
set(AUTOTEST_SOURCES
    test/assignment1/Test_hello.c
    test/assignment1/Test_assignment_validate.c
)

# Define tested source files
set(TESTED_SOURCE
    ../examples/autotest-validate/autotest-validate.c
)

# Generate Unity test runners
set(RUNNER_SOURCES "")
foreach(AUTOTEST_SOURCE ${AUTOTEST_SOURCES})
    string(REGEX REPLACE "(.+Test_[^.]+).c" "${CMAKE_CURRENT_SOURCE_DIR}/\\1_Runner.c" RUNNER_SOURCE ${AUTOTEST_SOURCE})
    list(APPEND RUNNER_SOURCES ${RUNNER_SOURCE})
endforeach()

# Print debug info
message(STATUS "Generating ${RUNNER_SOURCES} from ${AUTOTEST_SOURCES}")
message(STATUS "Building executable including ${RUNNER_SOURCES} ${AUTOTEST_SOURCES} and ${TESTED_SOURCE}")

# Add executable for tests
add_executable(assignment-autotest ${AUTOTEST_SOURCES} ${RUNNER_SOURCES} ${TESTED_SOURCE} ${CMAKE_CURRENT_SOURCE_DIR}/test/unity_runner.c)
target_link_libraries(assignment-autotest unity)

# Generate the test runner
add_custom_command(OUTPUT ${RUNNER_SOURCES} ${CMAKE_CURRENT_SOURCE_DIR}/test/unity_runner.c
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/auto_generate.sh ${AUTOTEST_SOURCES}
                   DEPENDS ${AUTOTEST_SOURCES}
)

set(CMAKE_BUILD_TYPE Debug)

