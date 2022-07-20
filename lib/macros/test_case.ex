defmodule MACROS.TestCase do
  defmacro __using__(_opts) do
    quote do
      import MACROS.TestCase
      @tests []
      @before_compile MACROS.TestCase
    end
  end

  defmacro test(description, do: block) do
    function_name = String.to_atom("test " <> description)
    quote do
      @tests [unquote(function_name) | @tests]
      def unquote(function_name)(), do: unquote(block)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        Enum.each @tests, fn name ->
          IO.puts "Running #{name}"
          apply(__MODULE__, name, [])
        end
      end
    end
  end
end