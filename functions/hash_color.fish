function hash_color
    echo $argv[1] | shasum -a 256 | cut -c1-6
end
