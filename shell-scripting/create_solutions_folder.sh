all_folders=( $(ls -d */) )

for dir in "${all_folders[@]}"; do
    if [ -d "$dir/practice/solutions" ]; then
        echo "solutions folder already exists in $dir/practice"
        rm -rf "$dir/practice/solutions"
    fi
    if [ ! -d "$dir/practice" ]; then
        mkdir "$dir/practice"
        echo "Created practice folder in $dir"
        touch "$dir/practice/questions.md"
        touch "$dir/practice/solutions.md"
    fi
    if [ ! -d "$dir/practice/solutions" ]; then
        mkdir -p "$dir/practice/solutions"
        echo "Created solutions folder in $dir/practice"
    fi
done
