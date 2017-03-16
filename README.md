# Circular

**Simple circular list implementation.**

## Usage

```elixir
clist = CircularList.new([1,2,3])
{1, clist} = CircularList.next(clist)
{2, clist} = CircularList.next(clist)
{3, clist} = CircularList.next(clist)
{1, clist} = CircularList.next(clist)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `circular` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:circular, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/circular](https://hexdocs.pm/circular).

