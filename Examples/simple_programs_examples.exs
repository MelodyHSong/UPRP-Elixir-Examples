#☆
#☆ Author: ✩ MelodyHSong ✩
#☆ Language: Elixir
#☆ File Name: simple_programs_examples.exs
#☆ Date: 2025-10-30
#☆

# =========================================================
# I. Simple Program Examples (Matching PDF Examples 1-11)
# =========================================================

# --- Example 1: Hello, World! ---
# IO.puts prints a string followed by a newline.
IO.puts("1. Hello, World!") 


# --- Example 2: Variables and Pattern Matching ---
# The = operator is the match operator.
x = 10 
IO.puts("2a. Value of x is \#{x}")
# Rebinding x to 20 creates a NEW value, demonstrating immutability.
x = 20
IO.puts("2b. New value of x is \#{x}")

# Pattern matching deconstructs the tuple.
{status, message} = {:ok, "Success"}
IO.puts("2c. Status is \#{status}, message is '\#{message}'")


# --- Example 3: Basic Arithmetic ---
a = 10
b = 5
IO.puts("3. Division (Float): \#{a / b}") # Result: 2.0
IO.puts("3. Integer Division: \#{div(a, b)}") # Result: 2


# --- Example 4: A Simple Module and Function ---
defmodule Greeter do
  # def defines a public function.
  def hello(name) do
    "Hello, \#{name}!" 
  end
end

IO.puts("4. Function Call: \#{Greeter.hello("Elixir Dev")}")


# --- Example 5: case Statement ---
defmodule HttpHandler do
  def handle_response(response) do
    # Matches response against clauses from top to bottom.
    case response do
      # Matches {:ok, anything} and binds "Welcome!" to body.
      {:ok, body} -> 
        "5a. Success! Body: \#{body}"
      # Matches {:error, 404, anything}. Underscore ignores the message value.
      {:error, 404, _} -> 
        "5b. Error: Not Found"
      # Catch-all clause.
      _ -> 
        "5c. Unknown response"
    end
  end
end
IO.puts("5. Case Example: \#{HttpHandler.handle_response({:ok, "Welcome!"})}")


# --- Example 6: Working with Lists and Enum ---
numbers = [1, 2, 3, 4, 5]
# Enum.map applies a function to every element and returns a new list.
doubled = Enum.map(numbers, fn num -> num * 2 end)
IO.puts("6. Doubled List: \#{inspect(doubled)}")


# --- Example 7: The Pipe Operator in Action ---
# Demonstrates clean data flow.
final_value = 1..10
|> Enum.map(fn x -> x * x end) # Square each number
|> Enum.filter(fn x -> rem(x, 2) != 0 end) # Keep only odd numbers
|> Enum.sum() # Sum the result

IO.puts("7. Piped Sum: \#{final_value}")


# --- Example 8: Working with Maps ---
user = %{name: "Melody", language: "Elixir", level: 10}
# Dot notation for access when keys are atoms.
IO.puts("8. Map Access: \#{user.name}")
# Special syntax to create a NEW map with updates.
updated_user = %{user | level: 11}
IO.puts("8. Updated Level: \#{updated_user.level}")


# --- Example 9: Recursive Factorial with Pattern Matching (Defined in Ex. 4) ---
# Re-using the Math module from the first file.
IO.puts("9. Factorial of 5: \#{Math.factorial(5)}")


# --- Example 10: cond Statement ---
age = 25
status = 
  cond do
    age < 13 -> "Child"
    age >= 13 and age < 20 -> "Teenager"
    # 'true' acts as the final 'else'
    true -> "Adult"
  end

IO.puts("10. Age Status: \#{status}")


# --- Example 11: Simple Concurrency with spawn ---
# Define a task as an anonymous function (actor behavior)
task = fn -> IO.puts("11. Hello from another process!") end

# spawn runs the function in a new, lightweight process.
spawn(task)

# The main script pauses to ensure the new process has time to run its IO.
Process.sleep(100) 
IO.puts("11. Hello from the main process!")
