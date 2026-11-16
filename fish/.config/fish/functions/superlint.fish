function superlint

    docker pull ghcr.io/super-linter/super-linter:slim-latest --platform linux/amd64
    docker run \
        -e RUN_LOCAL=true \
        -e USE_FIND_ALGORITHM=true \
        -e VALIDATE_TSX=true \
        -e VALIDATE_GOOGLE_JAVA_FORMAT=true \
        -e VALIDATE_CHECKOV=true \
        -v (pwd):/tmp/lint ghcr.io/super-linter/super-linter:slim-latest --platform linux/amd64
end
