

def outer_func(msg):
    def inner_func():
        print(f"메시지: {msg}")

    return inner_func

closure = outer_func("안녕하세요")
closure()