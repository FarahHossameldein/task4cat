#!/bin/bash

# Default values
length=12
complexity=3

# Parse command line arguments
while getopts ":l:c:" opt; do
  case $opt in
    l)
      length=$OPTARG
      ;;
    c)
      complexity=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Check complexity requirements
if (( complexity < 1 || complexity > 3 )); then
  echo "Invalid complexity value. Complexity must be between 1 and 3." >&2
  exit 1
fi

# Define character sets based on complexity level
case $complexity in
  1)
    characters="a-zA-Z0-9"
    ;;
  2)
    characters="a-zA-Z0-9!@#$%^&*"
    ;;
  3)
    characters="a-zA-Z0-9!@#$%^&*()_+~\`|}{[]\:;?><,./-="
    ;;
esac

# Generate random password
password=$(LC_ALL=C tr -dc "$characters" < /dev/urandom | head -c "$length")

# Print the generated password
echo "Generated password: $password"
