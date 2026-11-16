function cgon
    set -gx HUSKY 1
    echo "commitguard / husky is now active"
end

function cgoff
    set -gx HUSKY 0
    echo "commitguard / husky is now inactive"
end

function cgtoggle

    if test $HUSKY -eq "1"
        cgoff
    else
        cgon
    end

end
