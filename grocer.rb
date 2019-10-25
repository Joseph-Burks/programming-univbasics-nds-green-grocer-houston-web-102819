def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length do
    return collection[i] if name === collection[i][:item]
    i += 1
  end
  nil
end

def consolidate_cart(cart)
  new_cart = []
  i = 0
  while i < cart.length do
    item = cart[i][:item]
    search = find_item_by_name_in_collection(item, new_cart)
    if search
      search[:count] += 1
    else
      cart[i][:count] = 1
      new_cart << cart[i]
    end
    i += 1
  end
  new_cart
end

def make_coupon_hash(coupon)
  {
    :item =>
    :price =>
    
  }
  
def apply_coupons(cart, coupons)
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
