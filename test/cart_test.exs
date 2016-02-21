defmodule CartTest do
  use ExUnit.Case
  doctest Cart

  test "contain" do
    product = 'milk'
    assert Cart.contains([], product) == false
    cart = [{:add, 'milk'}]
    assert Cart.contains(cart, product) == true
    assert Cart.contains(cart, 'apple') == false
    cart = [{:add, 'milk'}, {:remove, 'milk'}]
    assert Cart.contains(cart, product) == false
  end

  test "get cart" do
    assert Cart.get_cart == []
    # TODO: Try to remove a product
    # from an empty cart
    # assert Cart.check()
  end

  test "add product" do
    cart = Cart.get_cart
    product = 'milk'
    refute Cart.add_product(cart, product) == []
    assert Cart.add_product(cart, product) == [{:add, 'milk'}]
    assert Cart.add_product([{:add, 'milk'}], product) == [{:add, 'milk'},{:add, 'milk'}]
    product='banana'
    assert Cart.add_product([{:add, 'milk'},{:add,'milk'}], product) == [{:add, 'milk'},{:add, 'milk'},{:add,'banana'}]
  end

  test "remove produkt" do
    cart = Cart.get_cart
    product = 'milk'
    assert Cart.remove_product(cart, product) == cart
    cart = [{:add, product}]
    assert Cart.remove_product(cart, product) == [{:add, product}, {:remove, product}]
    assert Cart.remove_product(Cart.remove_product(cart, product), product) == [{:add, product}, {:remove, product}]
  end



  test "final cart" do
    cart = Cart.get_cart
    product = 'milk'
    cart=Cart.add_product(cart,product)
    cart=Cart.add_product(cart,product)
    cart=Cart.add_product(cart,product)
    cart=Cart.remove_product(cart,product)
    product='banana'
    cart=Cart.add_product(cart,product)
    
    assert Cart.sum_up_product_in_cart(cart)==['milk','milk','banana']

  end

end
