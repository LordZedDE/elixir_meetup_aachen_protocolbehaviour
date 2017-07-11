defprotocol Temperature do
  @doc """
  Convert Kelvin and Fahrenheit to Celsius degree
  """
  def to_celsius(degree)
end

defmodule Celsius do
  defstruct name: "Celsius", symbol: "°C", degree: 0
end

defmodule Kelvin do
  defstruct name: "Kelvin", symbol: "K", degree: 0

  defimpl Temperature do
    @doc """
    Deduct 273.15
    """
    def to_celsius(kelvin) do
      celsius_degree = kelvin.degree - 273.15
      %Celsius{degree: celsius_degree}
    end
  end
end

defmodule Fahrenheit do
  defstruct name: "Fahrenheit", symbol: "°F", degree: 0

  defimpl Temperature do
    @doc """
    Deduct 32, then multiply by 5, then divide by 9
    """
    def to_celsius(fahrenheit) do
      celsius_degree = (fahrenheit.degree - 32) * 5 / 9
      %Celsius{degree: celsius_degree}
    end
  end
end
