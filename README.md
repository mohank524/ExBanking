# ExBanking

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_banking` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_banking, "~> 0.1.0"}
  ]
end
```

The command line to install dependencies
```
$ mix deps.get 
```

The command line to execute tests

```
$ mix test
```

The command line to execute Interactive Shell (IEx)
```
$ iex -S mix

iex(1)> Ex        
ExBanking    Exception    
iex(1)> ExBanking.create_user("mohan")
:ok
iex(2)> ExBanking.create_user("kumar")
:ok  
iex(3)> ExBanking.deposit("mohan", 10, "EUR")
{:ok, 10.0}
iex(4)> ExBanking.deposit("kumar", 10, "EUR")
{:ok, 10.0}
iex(5)> ExBanking.withdraw("kumar", 1, "EUR") 
{:ok, 9.0}
iex(6)> ExBanking.get_balance("kumar", "EUR")   
{:ok, 9.0}
iex(7)> ExBanking.send("mohan", "kumar", 1,  "EUR")
{:ok, 9.0, 10.0}
iex(8)> 

```

The command line to execute documentation

```
$ mix docs
```
