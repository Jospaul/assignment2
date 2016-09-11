Code.compiler_options(ignore_module_conflict: true)

defmodule Ex03 do
  require Integer

  ##############################################################################
  # 3: 4 questions,  20 points available                                       #
  ##############################################################################
  # Rubric (per question):                                                     #
  #                                                                            #
  # Does it pass tests?. . . . . . . . . . . . . . . . 60%                     #
  #                                                                            #
  # Was is written using the given constraints? Is . . 20%                     #
  # it free of any errors not found by the tests                               #
  #                                                                            #
  #                                                                            #
  # Is it written in a functional, Elixir style? . . . 20%                     #
  ##############################################################################

  @moduledoc """

  All the exercises in this module should be solved using _named
  functions_ (`def fname...`).

  The `iex` sessions in the documentation block for each shows samples
  of how the function should be used.

  Remember you can load this code in `iex` from the command line and
  play with it using:

      $ iex ex03.ex

  You can run tests using:

      $ elixir ex03.ex

  Use no library functions unless explicitly noted.
  """

  ##############################################################################
  # 3.1:  5 points #
  ##################

  @doc """

  Write a function (or functions) that take a list of integers and
  generates a new list of atoms, where the output list contains `:odd`
  is the corresponding integer is odd, `:even` otherwise.

      iex> Ex03.odd_even [ 1, 2, 4, 7, 9 ]
      [ :odd, :even, :even, :odd, :odd ]

  (The library functions `Integer.is_even` and `Integer.is_odd` may
  be used if needed.)

  """

  def oddeven(a) do
    cond do
      rem(a,2) > 0 -> :Odd
      rem(a,2) == 0 -> :Even
    end
  end

  def odd_even([])  do
    []
  end
  def odd_even([h|t]) do
    [oddeven(h) | odd_even(t)]
  end


  ##############################################################################
  # 3.2:  5 points #
  ##################

  @doc """
  Write a function that returns true if a list contains a
  given value, false otherwise.

      iex> Ex03.list_contains([ 1, 2, 3, 4], 3)
      true

      iex> Ex03.list_contains([ 1, 2, 3, 4], 3)
      true

      iex> Ex03.list_contains([ 1, 2, 3, 4], 3)
      true

  """

  def list_contains([],a) do
  	false
  end
  def list_contains([h|t],a) do
  	cond do
  		h==a -> true
  		h!=a -> list_contains(t,a)
  	end
  end

  ##############################################################################
  # 3.3:  5 points #
  ##################

  @doc """
  Two lists are equal if they contain the same number of elements,
  and each element in one equals the corresponding element in
  the other. Normally you use the operator `==` to test for this.

  However, let's assume that `==` doesn't work for lists. Write
  a function that checks for the equality of two lists. You don't
  need to consider nested lists.

      iex> Ex03.list_equal [ 1, 2, 3 ], [1, 2, 3]
      true
      iex> Ex03.list_equal [ 1, 2, 3 ], [1, 2, 3, 4]
      false
      iex> Ex03.list_equal [ 1, 2, 3 ], [3, 2, 1]
      false

  """

  def list_equal([],[]) do
  	true
  end
  def list_equal(a,b) do
  	lengthequal = lenequal(a,b)
  	cond do
  		lengthequal == true ->
  			[h|t]=a
  			[h1|t1]=b
  			cond do
  				h==h1 -> list_equal(t,t1)
  				true -> false
  			end
  		lengthequal != true -> false
  	end
  end

  defp lenequal(a,b) do
  	cond do
  		lenlist(a)!=lenlist(b) -> false
  		lenlist(a)==lenlist(b) -> true
  	end
  end

  defp lenlist([]) do
  	length = 0
  end
  defp lenlist([h|t]) do
  	length = 1 + lenlist(t)
  end



  ##############################################################################
  # 3.4:  5 points #
  ##################

  @doc """
  Inspired by recent computer wins in the game of Go, your team
  decides to push the boundaries of technology by implementing
  a noughts-and-crosses playing program.

  The team has decided to represent the board as a 9 element
  tuple:

       0 | 1 | 2
       --+---+--
       3 | 4 | 5      => { 1, 2, 3,  4, 5, 6,  7, 8, 9 }
       --+---+--
       6 | 7 | 8

  Each element of the tuple is set to :x or :o if the corresponding
  player has occupied the square, or its number otherwise.


       X | X |
       --+---+--
         | O |        => { :x, :x, 3,   4, :o, 6,   7, :o, :x }
       --+---+--
         | O | X

  There are eight winning positions (three horizontal, three vertical,
  and two diagonal). Write a function that returns :x if X has won, :o
  if O has won, and false otherwise.

      iex> Ex03.won { :x, :o, 3,   :x, 5, :o,   :x, 8, :o }
      :x

      iex> Ex03.won { :o, :x, 3,   :x, :o, 6,   :x, 5, :o }
      :o

      iex> Ex03.won { :o, :x, 3,   :x, :o, 6,   :x, :o, 9 }
      false

  Think a little about a nice way to lay this code out.
  """

  def won({:x,a,b,c,:x,d,e,f,:x}), do: :x
  def won({:o,a,b,c,:o,d,e,f,:o}), do: :o
  def won({a,b,:x,c,:x,d,:x,e,f}), do: :x
  def won({a,b,:o,c,:o,d,:o,e,f}), do: :o
  def won({:x,a,b,:x,c,d,:x,e,f}), do: :x
  def won({:o,a,b,:o,c,d,:o,e,f}), do: :o
  def won({a,:x,b,c,:x,d,e,:x,f}), do: :x
  def won({a,:o,b,c,:o,d,e,:o,f}), do: :o
  def won({a,b,:x,c,d,:x,e,f,:x}), do: :x
  def won({a,b,:o,c,d,:o,e,f,:o}), do: :o
  def won({:x,:x,:x,a,b,c,d,e,f}), do: :x
  def won({:o,:o,:o,a,b,c,d,e,f}), do: :o
  def won({a,b,c,:x,:x,:x,d,e,f}), do: :x
  def won({a,b,c,:o,:o,:o,d,e,f}), do: :o
  def won({a,b,c,d,e,f,:x,:x,:x}), do: :x
  def won({a,b,c,d,e,f,:o,:o,:o}), do: :o
  def won({a,b,c,d,e,f,g,h,i}), do: false


  ###########################
  # IGNORE FROM HERE TO END #
  ###########################

  @after_compile __MODULE__

  def __after_compile__(_env, bytecode) do
    File.write("Elixir.Ex03.beam", bytecode)
  end

end


ExUnit.start
defmodule TestEx03 do
  use ExUnit.Case
  doctest Ex03
end
