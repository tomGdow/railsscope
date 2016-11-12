## railsscope

A simple Rails app illustrating the use of scope, created with Rails 5.0 (and postgreSQL as database)

### Brief log

    rails new railsscope -d postgresql

 A basic Rails scaffold was generated

    rails generate scaffold Product name:string category:string description:text price:float
The following methods were added to app/controllers/product_controller.rb

    def fruit
        @fruit = Product.fruit.all
    end 
    def car 
       @car = Product.car.all
    end

The key code is the following ( /app/models/product.rb)

    CATEGORY_TYPES = ['fruit', 'car']
    scope :fruit, -> {where("category = ?","fruit")}
    scope :car, -> {where("category = ?","car")}
In config/routes.rb

    root to: 'products#index'
    resources :products do
      collection do
        get 'fruit', defaults: {format: :json}
        get 'car', defaults: {format: :json}
      end 
    end 
    get '/fruit' => redirect('/products/fruit')
    get '/car' => redirect('/products/car')
    get '/cars' => redirect('/products/car')

In app/views/products, created 'fruit.json.jbuilder':

    json.array! @fruit, partial: 'products/product', as: :product  

In app/views/products, created 'car.json.jbuilder':
    json.array! @car, partial: 'products/product', as: :product 

## Deployment

http://railsscope.tomgdow.com/products

http://railsscope.tomgdow.com/products/fruit

http://railsscope.tomgdow.com/products/car

http://railsscope.tomgdow.com/fruit

http://railsscope.tomgdow.com/car

http://railsscope.tomgdow.com/cars

