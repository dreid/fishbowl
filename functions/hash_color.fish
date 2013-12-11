function hash_color
	echo $argv[1] | md5 | cut -c1-6
end
