defmodule CircularListTest do
  use ExUnit.Case
  doctest CircularList, async: true

  setup do
    clist = CircularList.new([1,2,3])
    {:ok, clist: clist}
  end

  test "Create Circular List", %{clist: clist} do
    assert clist == {[], [1,2,3]}
  end

  test "Get next item on the list", %{clist: clist} do
    assert CircularList.next(clist) == {1, {[1], [2,3]}}
  end

  test "Call next twice", %{clist: clist} do
    {_, clist} = CircularList.next(clist)
    {x, _list} = CircularList.next(clist)
    assert x == 2
  end

  test "Call next four times", %{clist: clist} do
    {_, clist} = CircularList.next(clist)
    {_, clist} = CircularList.next(clist)
    {_, clist} = CircularList.next(clist)
    {x, _list} = CircularList.next(clist)
    assert x == 1
  end

  test "Peek", %{clist: clist} do
    {x, clist} = CircularList.next(clist)
    {y, clist} = CircularList.peek(clist)

    assert x == 1
    assert y == 2

    {z, _list} = CircularList.next(clist)
    assert z == 2
  end

  test "Call next three times then peek", %{clist: clist} do
    {_, clist} = CircularList.next(clist)
    {_, clist} = CircularList.next(clist)
    {_, clist} = CircularList.next(clist)
    {x, clist} = CircularList.peek(clist)
    assert x == 1

    assert clist == {[3,2,1], []}

    {y, _list} = CircularList.peek(clist)
    assert y == 1
  end
end
