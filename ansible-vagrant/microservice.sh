function startMicroservice {
    if isRunning; then 
        echo "The microservice is already running."
    else 
        go run calculator.go &
        echo "Service running"
    fi 
}


function stopMicroservice {
    if isRunning; then 
        kill `pidof calculator`
    else 
        echo "The microservice is already not running."
    fi 
}


function statusMicroservice {
    if isRunning; then 
        echo "RUNNING"
    else 
        echo "NOT RUNNING"
    fi   
}


function isRunning {
    [ "$(pidof calculator)" ]
}


function executeCommand {
    case $command in
        "start")
            startMicroservice
        ;;
        "stop")
            stopMicroservice
        ;;
        "status")
            statusMicroservice
        ;;
        *)
            echo "Invalid command! use: ./microservice.sh [start|stop|status] (name)"
        ;;
    esac
}


function setCommand {
    command=$1
}

setCommand $1
executeCommand