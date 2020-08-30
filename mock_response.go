package main

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"net/http"
	"strings"
)

func main() {

	type Item struct {
		Id    int    `json: "id"`
		Title string `json: "title"`
	}
	// response := make([]map[string]string, 10)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		max := 100
		response := []Item{}
		for id := 1; id <= max; id++ {
			response = append(response, Item{Id: id, Title: getRandString(int64(id))})
		}

		res, _ := json.Marshal(response)
		fmt.Fprintf(w, string(res))
	})

	http.ListenAndServe(":5050", nil)
}

func getRandString(seed int64) string {
	rand.Seed(seed)

	//Only lowercase
	charSet := "abcdedfghijklmnopqrst"
	var output strings.Builder
	length := 10
	for i := 0; i < length; i++ {
		random := rand.Intn(len(charSet))
		randomChar := charSet[random]
		output.WriteString(string(randomChar))
	}
	defer output.Reset()
	return output.String()
}
