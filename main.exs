defmodule Say do
  def hello_world(name) do
    IO.puts("Hello " <> name <> "!")
  end
end

Say.hello_world("John")

defmodule User do
  defstruct name: "", age: 0

  @spec create(String.t(), String.t()) :: %User{}
  def create(name, age) do
    IO.puts("Created new user with name: " <> name)
    %User{name: name, age: age}
  end

  @spec create(String.t(), String.t(), String.t(), String.t()) :: [%User{}]
  def create(name, age, name2, age2) do
    IO.puts("Created new user with name: " <> name)
    IO.puts("Created new user with name: " <> name2)
    [%User{name: name, age: age}, %User{name: name2, age: age2}]
  end

  def put(user = %User{}) do
    IO.puts("Username: " <> user.name)
    IO.puts("User age: #{user.age}")
  end

  @spec put(list(%User{})) :: :ok
  def put(users) do
    Enum.each(users, fn u -> User.put(u) end)
    :ok
  end
end

users = User.create("Nagy Pista", 18, "Peter Griffin", 45)
user = [User.create("John Doe", 24)]
users = users ++ user
users |> User.put()

# These two lambda function declarations are the same.
# & <- Capture operator
# lambda = fn x, y, z -> z * y + x end
lambda = &(&1 + &2 + 2)

lambda.(1, 2) |> IO.puts()

keys = MapSet.new([:a, :b, :c])
MapSet.member?(keys, :c) |> IO.puts()

date = ~D[2023-05-02]
date.year |> IO.puts()
date.day |> IO.puts()

time = ~T[12:53:32.000123]
naive_datetime = ~N[2023-12-23 08:32:12.000111]

naive_datetime.year |> IO.puts()
datetime = DateTime.from_naive!(naive_datetime, "Etc/UTC")

IO.puts("datetime = #{datetime}")
datetime.day |> IO.puts()

# Patterns and pattern matching
# Left side is a pattern right side is an expr
# {pattern = expr}
# Good for de-structuring!
person = {"John", 25}

{name, age} = person

{name, age} = {"John", 25}

name |> IO.puts()
age |> IO.puts()

{date, time} = :calendar.local_time()

1 = 1

rect = {:rect, 10, 20}
{:rect, width, height} = rect

IO.puts("width: #{width}, height: #{height}!")

# {:ok, contents} = File.read("example.txt")

{_date, {hour, _, _}} = :calendar.local_time()

IO.puts("Hour: #{hour}")

x = 10
# Pin operator > "^" pin a match it cannot be reassigned. It's for not binding to a new variable!
{^x, _} = {10, "hello"}
# fails
# {^x, _} = {11, "hello"}

[1, s, t] = [1, 2, 3]
[head | _] = [1, 2, 3, 4, 5]
IO.puts("Head: #{head}")

# Min is head after the sort which in this case is: 1
[min | _] = Enum.sort([3, 5, 2, 1])

IO.puts("Min: #{min}")

%{name: name, age: age} = %{age: 25, name: "John"}
# the left side does not need to contain all keys in case of Map data structures.
%{age: age} = %{name: "John", age: 25}

IO.puts("Age: #{age}")

# Resource: https://piped.video/watch?v=V_4-Iswp3II&t=811
