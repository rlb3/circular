defmodule DayListTest do
  use ExUnit.Case
  doctest DayList

  test "Forward list" do
    assert DayList.run(:sun, :sat) == [:sun, :mon, :tues, :wed, :thurs, :fri, :sat]
  end

  test "Partial forward list" do
    assert DayList.run(:mon, :fri) == [:mon, :tues, :wed, :thurs, :fri]
  end

  test "Simple reverse list" do
    assert DayList.run(:sat, :sun) == [:sat, :sun]
  end

  test "Longer reverse list" do
    assert DayList.run(:tues, :mon) == [:tues, :wed, :thurs, :fri, :sat, :sun, :mon]
  end

  test "daylist" do
    assert DayList.run(:sun, :sat) == [:sun, :mon, :tues, :wed, :thurs, :fri, :sat]
  end

  test ":sun to :tues" do
    assert DayList.run(:sun, :tues) == [:sun, :mon, :tues]
  end

  test ":wed to :sat" do
    assert DayList.run(:wed, :sat) == [:wed, :thurs, :fri, :sat]
  end

  test ":wed to :fri" do
    assert DayList.run(:wed, :fri) == [:wed, :thurs, :fri]
  end


  test ":sat to :sun" do
    assert DayList.run(:sat, :sun) == [:sat, :sun]
  end

  test ":sat to :wed" do
    assert DayList.run(:sat, :wed) == [:sat, :sun, :mon, :tues, :wed]
  end
end
