function hash_color
    set -l md5 md5
    if not which md5 > /dev/null
        set -l md5 md5sum
    end

	echo $argv[1] | eval $md5 | cut -c1-6
end
