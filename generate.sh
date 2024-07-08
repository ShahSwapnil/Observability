#!/bin/bash

item_count=1;
telemetry="logs"

# Process flags using getopts
while getopts "ltma" opt; do
  case $opt in
    l) telemetry="logs" ;;
    t) telemetry="traces" ;;
	m) telemetry="metrics" ;;
	a) telemetry="all";;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done

# Check for remaining arguments after processing flags (indicates no options)
if [[ $# -eq 0 ]]; then
  echo "No options provided. Valid options are:" >&2
  echo "  -l: Generate Logs" >&2
  echo "  -t: Generate Traces" >&2
  echo "  -m: Generate Metrics" >&2
  echo "  -a: Generate Logs, Traces and Metrics" >&2
  exit
fi

# Check for remaining arguments (optional argument)
if [[ $# -gt 0 ]]; then
  # Check if the first argument is a valid integer
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Invalid argument: Please provide an integer as the optional argument." >&2
    exit 1
  fi

  if [[ $# -gt 1 ]] then
	item_count=$2  # Assign the second argument to the number variable
  fi
fi

echo "Generating ${item_count} ${telemetry}"

case $telemetry in
	"logs") 
		telemetrygen logs --otlp-endpoint otel:4317 --otlp-insecure --logs ${item_count} ;;
	"traces") 
		telemetrygen traces --otlp-endpoint otel:4317 --otlp-insecure --traces ${item_count} ;;
	"metrics")
		telemetrygen metrics --otlp-endpoint otel:4317 --otlp-insecure --metrics ${item_count} ;;
	"all")
		telemetrygen logs --otlp-endpoint otel:4317 --otlp-insecure --logs ${item_count} 
		telemetrygen traces --otlp-endpoint otel:4317 --otlp-insecure --traces ${item_count} 
		telemetrygen metrics --otlp-endpoint otel:4317 --otlp-insecure --metrics ${item_count} ;;
	*) echo "unknown option";;
esac
