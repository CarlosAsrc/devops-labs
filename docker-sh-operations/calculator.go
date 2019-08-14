package main

import (
	"fmt"
	"strconv"
	"net/http"
	"github.com/gorilla/mux"
	"encoding/json"
	"errors"
)

type Calc struct {
	NumberA    int
	NumberB    int
	Operation string
	Result int
}

type Response struct {
	Message string
}

var history []Calc = []Calc{}

func main() {
	mux := mux.NewRouter()

	mux.HandleFunc("/", Home)
	mux.HandleFunc("/calc/{operation}/{a}/{b}", CalcHandler)
	mux.HandleFunc("/calc/history", History)
	
	http.Handle("/", mux)
	http.ListenAndServe(":8080", nil)
}


func Home(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain; charset=utf-8")
	fmt.Fprintf(w, "Calculator Microservice\n\n")
	fmt.Fprintf(w, "Endpoints:\n\n")
	fmt.Fprintf(w, "----------SUM:\n")
	fmt.Fprintf(w, "http://localhost:8080/calc/sum/{a}/{b}\n\n")
	fmt.Fprintf(w, "----------SUB:\n")
	fmt.Fprintf(w, "http://localhost:8080/calc/sub/{a}/{b}\n\n")
	fmt.Fprintf(w, "----------MULT:\n")
	fmt.Fprintf(w, "http://localhost:8080/calc/mul/{a}/{b}\n\n")
	fmt.Fprintf(w, "----------DIV:\n")
	fmt.Fprintf(w, "http://localhost:8080/calc/div/{a}/{b}\n\n")
}


func CalcHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	vars := mux.Vars(r)
	calcResult, err := ExecuteOperation(vars["a"], vars["b"], vars["operation"])
	if(err != nil) {
		errorResponse,errToJson := json.Marshal(Response{err.Error()})
		if(errToJson != nil) {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Write(errorResponse)
		return
	}
	w.Write(calcResult)
}


func History(w http.ResponseWriter, r *http.Request) {
	response, err := json.Marshal(history)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.Write(response)
}


func ExecuteOperation(a string, b string, operation string) ([]byte,error) {
	numberA, numberB, errConvert := ConvertToInt(a, b)
	if(errConvert != nil) {
		return nil, errConvert
	}
	result, err := Calculate(numberA, numberB, operation)
	if(err != nil) {
		return nil, err
	}
	calc := Calc {numberA, numberB, operation, result}
	history = append(history, calc)
	response, err := json.Marshal(calc)
	if err != nil {
		return nil, err
	}
	return response, nil
}


func ConvertToInt(a string, b string) (int, int, error){
	numberA, errA := strconv.Atoi(a)
	numberB, errB := strconv.Atoi(b)
	if(errA == nil && errB == nil) {
		return numberA, numberB,nil
	}
	return 0, 0, errors.New("Numbers format is invalid!")
}


func Calculate(a int, b int, operation string) (int,error) {
	switch operation {
		case "sum": 
			return a+b, nil
		case "sub":
			return a-b, nil
		case "mul":
			return a*b, nil
		case "div":
			if(b == 0 ) {
				return 0, errors.New("Division by zero is invalid!")
			}
			return a/b, nil
		default:
			return 0, errors.New("Operation invalid!")
	}
}