cmake_minimum_required(VERSION 3.19)
project(foo VERSION 1.0.0 LANGUAGES CXX)

find_program(OCAML ocamlc REQUIRED)
execute_process(
  COMMAND ${OCAML} -where
  OUTPUT_VARIABLE OCAML_INC
  COMMAND_ERROR_IS_FATAL ANY
  )

add_library(foo STATIC foo.cpp)
target_include_directories(foo PRIVATE ${OCAML_INC})
