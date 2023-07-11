

function superlint

    docker pull github/super-linter:latest --platform linux/arm64
    docker run \
        -e RUN_LOCAL=true \
        -e USE_FIND_ALGORITHM=true \
        -e VALIDATE_GITLEAKS=false \
        -e VALIDATE_CSS=false \
        -v (pwd):/tmp/lint github/super-linter


end
