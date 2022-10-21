package myopa

default hello = false
default remote_data = false

remote_data = some_json {
    request := {
        # IP addr
        # "url": "http://ip.jsontest.com/",

        # Date and time
        "url": "http://date.jsontest.com/",

        # "url": "http://md5.jsontest.com/?text=example_text"

        "method": "GET"
    }
    response := http.send(request)
    response.status_code == 200
    some_json := response.body
}


hello {
    m := input.message
    m == "world"
}

newdata = msg {
    # msg := concat("", ["Received the message: ", input.message])
    msg := concat("", ["Received IP address remotely: ", json.unmarshal(remote_data)])
}

importdata = msg {
	msg := concat("", ["Received the static data: ", data.rule])
}