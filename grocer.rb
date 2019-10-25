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

def make_coupon_hash(coup)
  {
    :item => "#{coup[:item]} W/COUPON",
    :price => (coup[:cost].to_f * 1.0/ coup[:num]).round(2),
    :count => coup[:num]
  }
end

def apply_the_coupon(matched, coupon, cart)
  matched[:count] -= coupon[:num]
  item_w_coupon = make_coupon_hash(coupon)
  item_w_coupon[:clearance] = matched[:clearance]
  cart << item_w_coupon
end

def apply_coupons(cart, coupons)
  i = 0
  while i < cart.length do
    coupon = coupons[i]
    item_has_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_in_cart = !!item_has_coupon
    count_is_large_enough = item_in_cart && item_has_coupon[:count] >= single_coupon[:num]
    if item_in_cart && count_is_large_enough
      apply_the_coupon(item_has_coupon, single_coupon, cart)
    end
    i += 1
  end
  cart
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
