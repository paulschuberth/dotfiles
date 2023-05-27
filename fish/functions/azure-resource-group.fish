
function aint
    set -gx SP_CLIENT_ID $AZ_CLIENT_ID_ACPP_INT
    set -gx SP_CLIENT_SECRET $AZ_CLIENT_SECRET_ACPP_INT
    az account set --subscription CARIAD.mega.westeurope-product-dev-berlin
end

function aprod
    set -gx SP_CLIENT_ID $AZ_CLIENT_ID_ACPP_PROD
    set -gx SP_CLIENT_SECRET $AZ_CLIENT_SECRET_ACPP_PROD
    az account set --subscription CARIAD.mega.westeurope-product-prod-lisbon
end
