defmodule CircularList do
  @moduledoc """
  Provide a data structure and functions to provide a circular list.
  """

  @doc """
  Create a new circular list.

  ## Parameters

     - list: Initial list that is to be made circular.

  ## Example

     iex> CircularList.new([1,2,3])
     {[], [1, 2, 3]}
  """

  @type clist(list, list) :: {list, list}

  @spec new(list()) :: clist([], list())
  def new(list) when is_list(list) do
    {[], list}
  end

  @doc """
  Get the next value from the circular list.

  ## Parameters

     - clist: A circular list

  ## Example

  iex> {x,_} = CircularList.new([1,2,3]) |> CircularList.next()
  iex> x == 1
  true
  """

  @spec next(clist(list(), list())) :: {any(), clist(list(), list())}
  def next({old, [x|new]}) do
    {x, {[x|old], new}}
  end

  def next({old, []}) do
    next({[], Enum.reverse(old)})
  end

  @doc """
  Get the next value with out updating the circular list's state.

  ## Parameters

     - clist: A circular list

  ## Example

  iex> {x,_} = CircularList.new([1,2,3]) |> CircularList.peek()
  iex> x == 1
  true
  """

  @spec peek(clist(list(), list())) :: {any(), clist(list(), list())}
  def peek({old, [x|_] = new}) do
    {x, {old, new}}
  end

  def peek({old, []} = clist) do
    {x, _} = peek({[], Enum.reverse(old)})
    {x, clist}
  end
end
