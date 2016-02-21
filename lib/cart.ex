defmodule Cart do
  def contains(cart, product) do
    add_count = Enum.count(cart, fn (x) -> x == {:add, product} end)
    remove_count = Enum.count(cart, fn (x) -> x == {:remove, product} end)
    add_count > remove_count
  end

  def get_cart(), do: []

  def add_product(cart, product) do
     cart ++ [{:add,product}]
  end

  def remove_product(cart,product) do
    if contains(cart, product) == true do
      cart ++ [{:remove,product}]
    else
      cart
    end
  end
  def show_all(cart),do: IO.puts cart

  def sum_list([head | tail],accumulator) do
    #IO.puts Tuple.to_list head
    #IO.puts Tuple.to_list head
    head=Tuple.to_list(head)
    head=List.last(head)
    sum_list(tail,[head] ++ accumulator)
  end
  def sum_list([],accumulator) do
    accumulator
  end
  def sum_up_product_in_cart(cart) do
     sum_list(cart,[])
    #add_count = Enum.count(cart, fn (x) -> x == {:add, product} end)
    #remove_count = Enum.count(cart, fn (x) -> x == {:remove, _ } end)

  end
end
