
# Wrapper around the sail command
#

function pest

    if test -e ./vendor/bin/pest
        ./vendor/bin/pest $argv
    else
        echo "Pest is not available"
    end

end
