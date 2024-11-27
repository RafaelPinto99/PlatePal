# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Recipe.destroy_all

User.create!(
  first_name: 'Rita',
  last_name: 'Salema',
  email: 'pintorafael1999@gmail.com',
  password: 'gcm12345'
)

# Seed 30 recipes manually
recipes = [
  {
    name: "Spaghetti Carbonara",
    ingredients_list: ["spaghetti", "eggs", "bacon", "parmesan cheese", "garlic", "black pepper"],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Cook pasta, fry bacon, mix with eggs and cheese, combine with pasta.",
    cook_time: 20,
    image_url: "https://www.sipandfeast.com/wp-content/uploads/2022/09/spaghetti-carbonara-recipe-snippet.jpg"
  },
  {
    name: "Chicken Alfredo",
    ingredients_list: ["chicken breast", "fettucine pasta", "cream", "parmesan cheese", "garlic", "butter"],
    servings: 4,
    calories: 600,
    restrictions: ["normal"],
    instructions: "Cook chicken, make creamy sauce, toss with pasta.",
    cook_time: 30,
    image_url: "https://www.budgetbytes.com/wp-content/uploads/2022/07/Chicken-Alfredo-above.jpg"
  },
  {
    name: "Vegetable Stir-Fry",
    ingredients_list: ["broccoli", "carrots", "bell peppers", "soy sauce", "garlic", "ginger", "tofu"],
    servings: 4,
    calories: 200,
    restrictions: ["vegan"],
    instructions: "Stir-fry vegetables and tofu, add soy sauce and serve.",
    cook_time: 20,
    image_url: "https://www.inspiredtaste.net/wp-content/uploads/2022/04/Veggie-Stir-Fry-Recipe-3-1200-1200x800.jpg"
  },
  {
    name: "Beef Tacos",
    ingredients_list: ["ground beef", "taco shells", "cheese", "lettuce", "tomato", "sour cream"],
    servings: 4,
    calories: 300,
    restrictions: ["normal"],
    instructions: "Cook beef, assemble tacos with toppings.",
    cook_time: 15,
    image_url: "https://kaynutrition.com/wp-content/uploads/2023/08/shredded-beef-tacos.jpg"
  },
  {
    name: "Pasta Primavera",
    ingredients_list: ["penne pasta", "zucchini", "cherry tomatoes", "garlic", "olive oil", "parmesan cheese"],
    servings: 4,
    calories: 350,
    restrictions: ["vegetarian"],
    instructions: "Cook pasta, sauté vegetables, toss with pasta and cheese.",
    cook_time: 25,
    image_url: "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/4DF59787-5161-4765-9192-3DFC138E9931/Derivates/80b7ae85-7dd5-488f-9318-6fea4601cf2f.jpg"
  },
  {
    name: "Grilled Cheese Sandwich",
    ingredients_list: ["bread", "cheese", "butter"],
    servings: 2,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Butter bread, add cheese, grill until golden.",
    cook_time: 10,
    image_url: "https://assets.epicurious.com/photos/59b2bccaed60845e59e6d3d1/4:3/w_4992,h_3744,c_limit/shutterstock_321217517.jpg"
  },
  {
    name: "Vegetable Soup",
    ingredients_list: ["carrots", "celery", "onions", "potatoes", "tomato", "vegetable broth"],
    servings: 6,
    calories: 150,
    restrictions: ["vegan"],
    instructions: "Simmer vegetables in broth until tender.",
    cook_time: 60,
    image_url: "https://thecozyapron.com/wp-content/uploads/2018/07/vegetable-soup_thecozyapron_1.jpg"
  },
  {
    name: "Lentil Soup",
    ingredients_list: ["lentils", "carrots", "celery", "tomatoes", "onions", "vegetable broth"],
    servings: 6,
    calories: 250,
    restrictions: ["vegan"],
    instructions: "Simmer lentils and vegetables in broth.",
    cook_time: 45,
    image_url: "https://cookieandkate.com/images/2019/01/best-lentil-soup-recipe-4.jpg"
  },
  {
    name: "Chicken Marsala",
    ingredients_list: ["chicken breasts", "marsala wine", "mushrooms", "butter", "parsley"],
    servings: 4,
    calories: 450,
    restrictions: ["gluten-free"],
    instructions: "Cook chicken and mushrooms, deglaze with wine, simmer to thicken.",
    cook_time: 40,
    image_url: "https://culinarybutterfly.com/wp-content/uploads/2021/08/Chicken-Marsala-1.png"
  },
  {
    name: "Shrimp Scampi",
    ingredients_list: ["shrimp", "garlic", "butter", "white wine", "lemon juice", "parsley", "spaghetti"],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Cook shrimp in garlic butter, add wine and lemon juice, toss with pasta.",
    cook_time: 20,
    image_url: "https://www.allrecipes.com/thmb/jiV_4f8vXFle1RdFLgd8-_31J3M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/229960-shrimp-scampi-with-pasta-DDMFS-4x3-e065ddef4e6d44479d37b4523808cc23.jpg"
  },
  {
    name: "Quinoa Salad",
    ingredients_list: ["quinoa", "cucumber", "tomato", "feta cheese", "olive oil", "lemon juice"],
    servings: 4,
    calories: 200,
    restrictions: ["vegetarian"],
    instructions: "Cook quinoa, mix with chopped vegetables, drizzle with olive oil and lemon juice.",
    cook_time: 15,
    image_url: "https://www.eatingbirdfood.com/wp-content/uploads/2024/04/easy-quinoa-salad-hero-cropped.jpg"
  },
  {
    name: "Stuffed Bell Peppers",
    ingredients_list: ["bell peppers", "ground beef", "rice", "tomato sauce", "cheese", "onions"],
    servings: 4,
    calories: 300,
    restrictions: ["normal"],
    instructions: "Stuff peppers with beef and rice mixture, bake with tomato sauce and cheese.",
    cook_time: 40,
    image_url: "https://www.howtocook.recipes/wp-content/uploads/2021/09/Stuffed-peppers-recipe.jpg"
  },
  {
    name: "Vegan Pad Thai",
    ingredients_list: ["rice noodles", "tofu", "peanut butter", "lime", "soy sauce", "bean sprouts"],
    servings: 4,
    calories: 250,
    restrictions: ["vegan"],
    instructions: "Cook noodles, stir-fry tofu, mix sauce, combine with vegetables and noodles.",
    cook_time: 25,
    image_url: "https://pinchofyum.com/wp-content/uploads/Vegetarian-Pad-Thai-Recipe.jpg"
  },
  {
    name: "Baked Salmon",
    ingredients_list: ["salmon fillet", "lemon", "garlic", "olive oil", "parsley"],
    servings: 4,
    calories: 400,
    restrictions: ["gluten-free"],
    instructions: "Season salmon, bake until cooked through.",
    cook_time: 25,
    image_url: "https://www.acouplecooks.com/wp-content/uploads/2020/01/Baked-Salmon-056.jpg"
  },
  {
    name: "Minestrone Soup",
    ingredients_list: ["zucchini", "carrots", "celery", "tomatoes", "pasta", "vegetable broth"],
    servings: 6,
    calories: 250,
    restrictions: ["vegan"],
    instructions: "Simmer vegetables in broth, add pasta and cook until tender.",
    cook_time: 50,
    image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574"
  },
  {
    name: "Gluten-Free Pancakes",
    ingredients_list: ["gluten-free flour", "milk", "eggs", "butter", "maple syrup"],
    servings: 4,
    calories: 300,
    restrictions: ["gluten-free"],
    instructions: "Mix batter, cook pancakes on griddle, serve with syrup.",
    cook_time: 20,
    image_url: "https://glutenfreebaking.com/wp-content/uploads/2024/06/Stack-of-gluten-free-pancakes.jpg"
  },
  {
    name: "Chickpea Curry",
    ingredients_list: ["chickpeas", "coconut milk", "curry powder", "onions", "garlic", "tomatoes"],
    servings: 4,
    calories: 300,
    restrictions: ["vegan"],
    instructions: "Simmer chickpeas in spiced coconut milk sauce.",
    cook_time: 30,
    image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/kadala-curry-fad4df3.jpg"
  },
  {
    name: "Eggplant Parmesan",
    ingredients_list: ["eggplant", "tomato sauce", "mozzarella", "parmesan", "bread crumbs"],
    servings: 4,
    calories: 350,
    restrictions: ["vegetarian"],
    instructions: "Bread eggplant slices, bake with sauce and cheese.",
    cook_time: 45,
    image_url: "https://www.theseasonedmom.com/wp-content/uploads/2024/07/baked-eggplant-parmesan-recipe-9-500x375.jpg"
  },
  {
    name: "Tofu Scramble",
    ingredients_list: ["tofu", "turmeric", "onions", "bell peppers", "spinach"],
    servings: 2,
    calories: 150,
    restrictions: ["vegan"],
    instructions: "Crumble tofu, sauté with vegetables and seasoning.",
    cook_time: 10,
    image_url: "https://thealmondeater.com/wp-content/uploads/2021/01/Tofu-Scramble-1-5.jpg"
  },
  {
    name: "Caprese Salad",
    ingredients_list: ["tomatoes", "mozzarella", "basil", "olive oil", "balsamic glaze"],
    servings: 2,
    calories: 250,
    restrictions: ["vegetarian"],
    instructions: "Layer tomato and mozzarella slices, drizzle with olive oil and balsamic glaze, garnish with basil.",
    cook_time: 10,
    image_url: "https://downshiftology.com/wp-content/uploads/2019/07/How-to-Make-Caprese-Salad-1.jpg"
  },
  {
    name: "Chicken Stir-Fry",
    ingredients_list: ["chicken breast", "broccoli", "carrots", "soy sauce", "ginger", "garlic"],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Stir-fry chicken and vegetables in soy sauce and ginger.",
    cook_time: 20,
    image_url: "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2021/05/Chicken-Stir-Fry-main-1.jpg"
  },
  {
    name: "Avocado Toast",
    ingredients_list: ["avocado", "whole-grain bread", "lemon", "red pepper flakes"],
    servings: 2,
    calories: 200,
    restrictions: ["vegan"],
    instructions: "Mash avocado, spread on toasted bread, sprinkle with lemon juice and red pepper flakes.",
    cook_time: 5,
    image_url: "https://www.eatingwell.com/thmb/PM3UlLhM0VbE6dcq9ZFwCnMyWHI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/EatingWell-April-Avocado-Toast-Directions-04-5b5b86524a3d4b35ac4c57863f6095dc.jpg"
  },
  {
    name: "Zucchini Noodles with Pesto",
    ingredients_list: ["zucchini", "basil pesto", "parmesan cheese", "pine nuts"],
    servings: 2,
    calories: 300,
    restrictions: ["gluten-free"],
    instructions: "Spiralize zucchini, toss with pesto, top with parmesan and pine nuts.",
    cook_time: 10,
    image_url: "https://cookieandkate.com/images/2016/06/zucchini-pesto-noodles-recipe-1-1.jpg"
  },
  {
    name: "Grilled Cheese Sandwich",
    ingredients_list: ["bread", "cheddar cheese", "butter"],
    servings: 2,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Butter bread slices, sandwich cheese between, grill until golden.",
    cook_time: 10,
    image_url: "https://assets.epicurious.com/photos/59b2bccaed60845e59e6d3d1/4:3/w_4992,h_3744,c_limit/shutterstock_321217517.jpg"
  },
  {
    name: "Vegetable Stir-Fry",
    ingredients_list: ["broccoli", "carrots", "snap peas", "soy sauce", "ginger", "garlic"],
    servings: 4,
    calories: 250,
    restrictions: ["vegan"],
    instructions: "Stir-fry vegetables in soy sauce and ginger.",
    cook_time: 15,
    image_url: "https://www.thesmalltownfoodie.com/wp-content/uploads/2018/05/Vegetable-Stir-Fry2.png"
  },
  {
    name: "Beef Tacos",
    ingredients_list: ["ground beef", "taco shells", "lettuce", "tomatoes", "cheddar cheese", "sour cream"],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Cook beef with seasoning, assemble tacos with toppings.",
    cook_time: 20,
    image_url: "https://feelgoodfoodie.net/wp-content/uploads/2024/04/Ground-Beef-Tacos-TIMG.jpg"
  },
  {
    name: "Cauliflower Pizza Crust",
    ingredients_list: ["cauliflower", "mozzarella", "egg", "tomato sauce", "toppings of choice"],
    servings: 4,
    calories: 200,
    restrictions: ["gluten-free"],
    instructions: "Make crust with cauliflower, egg, and cheese, bake and top with sauce and toppings.",
    cook_time: 30,
    image_url: "https://www.foodandwine.com/thmb/NyGVVE00futNqcMGVJTWGtxBrf8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/cauliflower-crust-pizza-XL-RECIPE2016-cd86bbae9c844c198c5ca38c052ee3db.jpg"
  },
  {
    name: "Lentil Soup",
    ingredients_list: ["lentils", "carrots", "celery", "onions", "tomato paste", "vegetable broth"],
    servings: 6,
    calories: 250,
    restrictions: ["vegan"],
    instructions: "Simmer lentils with vegetables in broth until tender.",
    cook_time: 40,
    image_url: "https://www.noracooks.com/wp-content/uploads/2018/11/square-1.jpg"
  },
  {
    name: "Chocolate Mug Cake",
    ingredients_list: ["flour", "cocoa powder", "sugar", "milk", "butter", "baking powder"],
    servings: 1,
    calories: 300,
    restrictions: ["normal"],
    instructions: "Mix ingredients in a mug, microwave for 90 seconds.",
    cook_time: 2,
    image_url: "https://www.afarmgirlsdabbles.com/wp-content/uploads/2013/02/gooey-chocolate-cake-cups_AFarmgirlsDabbles_AFD-6_sq.jpg"
  },
  {
    name: "Stuffed Sweet Potatoes",
    ingredients_list: ["sweet potatoes", "black beans", "corn", "avocado", "salsa"],
    servings: 4,
    calories: 350,
    restrictions: ["vegan"],
    instructions: "Bake sweet potatoes, stuff with black beans, corn, and toppings.",
    cook_time: 45,
    image_url: "https://www.southernliving.com/thmb/3hynCD8Jf97b7W5v-xdSG6YWECc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Southern-Living_27362_HIH_Sweet-Potatoes_13279-3b3cb9761d354178a73e3ed8cc557211.jpg"
  }
]

recipes.each do |recipe|
  created_recipe = Recipe.create(
    name: recipe[:name],
    ingredients_list: recipe[:ingredients_list],
    servings: recipe[:servings],
    calories: recipe[:calories], # Include calories
    restrictions: recipe[:restrictions], # Include restriction
    instructions: recipe[:instructions],
    cook_time: recipe[:cook_time]
  )

  # Attach image from URL if available
  if recipe[:image_url]
    io = URI.open(recipe[:image_url])
    created_recipe.image.attach(
      io: io,
      filename: "#{created_recipe.name.parameterize}.jpg",
      content_type: 'image/jpg'
    )
  end

  puts "Created Recipe: #{created_recipe.name} (#{created_recipe.restriction})"
end
