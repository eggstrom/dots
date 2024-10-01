# Get relevant data and exit if it's not there
output="$(acpi 2>/dev/null | head -1 | tr -d , | cut -d: -f2- | cut -d' ' -f2-4)"
[[ -z "$output" ]] && exit

# Print JSON string with data
echo "$output" | while read -r status capacity time; do
    echo "{\"status\":\"$status\",\"capacity\":${capacity::-1},\"time\":\"$time\"}"
done
