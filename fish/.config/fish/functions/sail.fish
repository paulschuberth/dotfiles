
# Wrapper around the sail command
#

function sail

    if test -e ./vendor/bin/sail
        ./vendor/bin/sail $argv
    else
        echo "Sail environment is not available"
    end

end
