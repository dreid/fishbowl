function prompt_user
    switch $USER

    case 'dreid'
        echo "♞ "
    case 'root'
        echo "♛ "
    case '*'
        echo $USER
    end
end
