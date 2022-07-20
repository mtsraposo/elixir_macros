defmodule MACROS.DynamicVar do
  defmacro initialize_to_char_count(variables) do
    Enum.map(variables, fn name ->
      var = Macro.var(name, nil)
      length = name |> Atom.to_string |> String.length

      quote do
        unquote(var) = unquote(length)
      end
    end)
  end
end