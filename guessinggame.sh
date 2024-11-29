#!/bin/bash

# Function to count files in the current directory
count_files() {
    local file_count=$(ls -1 | wc -l)
    echo "$file_count"
}

# Main game function
play_guessing_game() {
    local total_files=$(count_files)
    
    echo "Welcome to the Guessing Game!"
    echo "How many files are in the current directory?"
    
    while true; do
        read -p "Enter your guess: " user_guess
        
        # Validate input is a number
        if [[ ! "$user_guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi
        
        # Compare guess with actual file count
        if [[ "$user_guess" -lt "$total_files" ]]; then
            echo "Too low! Try again."
        elif [[ "$user_guess" -gt "$total_files" ]]; then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed the correct number of files: $total_files"
            break
        fi
    done
}

# Call the game function
play_guessing_game