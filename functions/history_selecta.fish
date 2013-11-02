function history_selecta
	set -l tmpfile (mktemp /tmp/history_selecta.XXXX)
    history | selecta > $tmpfile
    commandline (cat $tmpfile)
    rm $tmpfile
end
