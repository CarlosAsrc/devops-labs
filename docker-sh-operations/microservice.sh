function startMicroservice {
    if ! existImage; then
        echo "The docker image does not yet exist and will be built.."
        sudo docker build -t $microserviceName .
    fi
    if ! existContainer; then
        sudo docker run --name $microserviceName -p 8080:8080 $microserviceName &
        echo "$microserviceName Service is running on http://localhost:8080"
    else
        if ! isRunning; then
            sudo docker start $microserviceName
            echo "$microserviceName Service is running on http://localhost:8080"
        else
            echo "The microservice $microserviceName is already running."
        fi
    fi
}


function stopMicroservice {
    if existContainer && isRunning; then
        sudo docker stop $microserviceName
        echo "stopped"
    else
        echo "No $microserviceName microservice running!"
    fi
}


function statusMicroservice {
    if existContainer && isRunning; then 
        echo "RUNNING"
    else 
        echo "NOT RUNNING"
    fi   
}


function existContainer {
    [ "$(sudo docker ps -a -q -f name=$microserviceName)" ];
}

function isRunning {
    if [ "$(sudo docker inspect -f '{{.State.Running}}' $microserviceName)" == false ];
    then 
        return 1
    else 
        return 0 
    fi
}

function existImage {
    [ "$(sudo docker images -q $microserviceName)" ]
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

function setMicroserviceName {
    microserviceName=$1
}

setCommand $1
setMicroserviceName $2
executeCommand