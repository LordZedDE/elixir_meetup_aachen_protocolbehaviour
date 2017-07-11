defmodule Parser do
  @callback parse(String.t) :: any
  @callback extensions() :: [String.t]

#  def is_implemented?(module) do
#    module.module_info[:attributes]
#    |> Keyword.get(:behaviour, [])
#    |> Enum.member?(__MODULE__)
#  end
end

defmodule JSONParser do
  @behaviour Parser

  def parse(str), do: IO.puts "Parse #{str} to JSON..." # ... parse JSON
  def extensions, do: ["json"]
end


defmodule YAMLParser do
  @behaviour Parser

  def parse(str), do: IO.puts "Parse #{str} to YAML..." # ... parse YAML
  def extensions, do: ["yml"]
end

#defmodule ParserWorker do
#  def do_parse(parser, str) do
#    if Parser.is_implemented?(parser) do
#      parser.parse(str)
#    else
#      raise "The given module does not implement the Parser Behaviour."
#    end
#  end
#end
