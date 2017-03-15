defmodule DayList do
  @moduledoc false

  def run(start, stop) do
    full_list() |>
      gen_day_list(start, stop, [])
  end

  def gen_day_list(clist, start, stop, acc) do
    {day, new_clist} = CircularList.next(clist)

    cond do
      start_and_stop?(acc, start, stop) -> Enum.reverse(acc)
      started?(day, start) or start_but_not_stop?(acc, start, stop) ->
        gen_day_list(new_clist, start, stop, [day|acc])
      true -> gen_day_list(new_clist, start, stop, acc)
    end
  end

  defp full_list do
    CircularList.new([:sun, :mon, :tues, :wed, :thurs, :fri, :sat])
  end

  defp start_and_stop?(acc, start, stop) do
    Enum.member?(acc, start) && Enum.member?(acc, stop)
  end

  defp start_but_not_stop?(acc, start, stop) do
    Enum.member?(acc, start) && !Enum.member?(acc, stop)
  end

  defp started?(day, start) do
    start == day
  end
end
