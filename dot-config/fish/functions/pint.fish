
# Wrapper around the sail command
#

function pint

    if test -e ./vendor/bin/pint
        ./vendor/bin/pint $argv
    else
        echo "pint is not available"
    end

end
