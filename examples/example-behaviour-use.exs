defmodule Parser do
 @callback parse(String.t) :: any
 @callback extensions() :: [String.t]
 defmacro __using__(opts) do
       quote location: :keep, bind_quoted: [opts: opts] do
           @behaviour Parser

           def extensions, do: ["default"]

           defoverridable [extensions: 0]
       end
  end

  def is_implemented?(module) do
    module.module_info[:attributes]
    |> Keyword.get(:behaviour, [])
    |> Enum.member?(__MODULE__)
  end
end

defmodule JSONParser do
 use Parser

 def parse(str), do: IO.puts "#{str} parsed as JSON" # ... parse JSON
 def extensions, do: ["json"]
end

defmodule TXTParser do
 use Parser

 def parse(str), do: IO.puts "#{str} parsed as Text" # ... parse Text
# def extensions, do: ["json"]
end

defmodule YAMLParser do
 use Parser

 def parse(str), do: IO.puts "#{str} parsed as YAML" # ... parse YAML
 def extensions, do: ["yml"]
end

defmodule ParserWorker do
  def do_parse(parser, str) do
    if Parser.is_implemented?(parser) do
      parser.parse(str)
    else
      raise "The given module does not implement the Parser Behaviour."
    end
  end
end
