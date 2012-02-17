Smokefit::Application.routes.draw do
  root :to => "homepage#show"
  
  # Redirects handled by rails
  match "/contact_us" => redirect('/contact-us')
  
  match "/spages/benefits.htm" => redirect("/benefits")
  match "/spages/how-it-works.htm" => redirect("/how_it_works")
  match "/spages/testimonials.htm" => redirect("/testimonials")
  
  match "site-map/" => redirect("/")
  
  # products urls
  # accesories
  match "/products/accessories/battery.htm" => redirect("/products/electronic-cigarette-battery")
  match "/products/accessories/car-charger.htm" => redirect("/products/car-charger")
  match "/products/accessories/wall-charger.htm" => redirect("/products/wall-charger")
  match "/products/accessories/usb-charger.htm" => redirect("/products/usb-charger")
  match "/products/accessories/plastic-cigarette-box.htm" => redirect("/products/plastic-carrying-case")
  match "/products/accessories/carrying-case-white.htm" => redirect("/products/carrying-case")
  match "/products/accessories/carrying-case-black.htm" => redirect("/products/carrying-case")
  match "/products/accessories/carrying-case-red.htm" => redirect("/products/carrying-case")
  match "/products/accessories/carrying-case-silver.htm" => redirect("/products/carrying-case")
  
  # refills
  match "/products/cartridges/tobacco-strength-8mg.htm" => redirect("/products/tobacco-flavored-refills-high-strength")
  match "/products/cartridges/tobacco-strength-4mg.htm" => redirect("/products/tobacco-flavored-refills-low-strength")
  match "/products/cartridges/menthol-strength-8mg.htm" => redirect("/products/menthol-flavored-refills-high-strength")
  match "/products/cartridges/menthol-strength-4mg.htm" => redirect("/products/menthol-flavored-refills-low-strength")
  match "/products/cartridges/clove-strength-6mg.htm"   => redirect("/products/fruit-flavored-refills")
  match "/products/cartridges/clove-strength-4mg.htm"   => redirect("/products/fruit-flavored-refills")
  
  # products
  match "/products/starter-kits/basic-starter-kit.htm"  => redirect("/products/basic-starter-kit")
  match "/products/starter-kits/deluxe-starter-kit.htm" => redirect("/products/deluxe-kit")
  
  # blog
  match "/blog/" => redirect("http://ezeesmoke.tumblr.com/")
  
  # categories
  match "/products/accessories/"  => redirect("/t/categories/accessories")
  match "/products/refills/"      => redirect("/t/categories/refills")
  match "/products/starter-kits/" => redirect("/t/categories/kits")
  
  match "/spages/terms.htm" => redirect("/terms_of_service")
  
  match "/viewcart/" => redirect("/cart")
end
