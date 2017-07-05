defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end


#The Size protocol expects a function called size that receives one argument (the data structure we want to know the size of) to be implemented. We can now implement this protocol for the data structures that would have a compliant implementation:
defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

#defmodule Size do
#  def size(val) when is_map(val), do: map_size(val)
#  def size(val) when is_tuple, do: tuple_size(val)
#  def size(val) when is_bitstring, do: byte_size(val)
#end
