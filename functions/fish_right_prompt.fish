function fish_right_prompt --on-variable _
    if test (count $argv) -eq 3
        if test $argv[1] = "VARIABLE"
            if test $argv[3] = "_"
                if not set -q __cmd_start
                    set -g __cmd_start (date +%s)
                else
                    set -g __cmd_duration (math (date +%s)-$__cmd_start)
                    set -e __cmd_start
                end
            end
        end
    else
        if set -q CMD_DURATION
            set -l clocks 🕧 🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛 🕜 🕝 🕞 🕟 🕠 🕡 🕢 🕣 🕤 🕥 🕦
            echo -n $clocks[(math $__cmd_duration%(count $clocks)+1)] $CMD_DURATION
        end
    end
end
