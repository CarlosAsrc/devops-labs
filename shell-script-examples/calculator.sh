function readData {
    echo "Type expression delimited by spaces (ex: 2 + 1 ):"
    read expression

    IFS=' '
    read -ra array <<< "$expression"

    numberX=${array[0]}
    numberY=${array[2]}
    operation=${array[1]}
}


function compute {
    local result
    case "$operation" in
        "+")
            result=$(($numberX+$numberY))
        ;;
        "-")
            result=$(($numberX-$numberY))
        ;;
        "*")
            result=$(($numberX*$numberY))
        ;;
        "/")
            result=$(($numberX/$numberY))
        ;;
        *)
            echo "Invalid Operation!"
        ;;
    esac
    echo "Result: $result"
}

readData
compute